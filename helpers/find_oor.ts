/*
 * This helper indentifies those labels that were
 * out of range (>BFFF), then I manually added them to bank7.
 *
 * Usage: deno run --allow-read --allow-write find_oor.ts "file_path"
 */

import { join } from "https://deno.land/std@0.126.0/path/mod.ts";
const path = Deno.args.at(0)?.toString() || "./";

const map: {
  [addr: string]: {
    [bank: string]: boolean;
  };
} = {};

for await (const entry of Deno.readDir(path)) {
  const bank = ((v) => v == null ? v : v[1] == "" ? "0" : v[1])(
    entry.name.match(/prg([0-9]*).asm/),
  );
  if (entry.isFile && bank) {
    new TextDecoder().decode(
      await Deno.readFile(join(path, entry.name)),
    )
      .match(/__[C-Fc-f][0-Fa-f]{3}/g)?.forEach(
        (v: string) => {
          v = v.slice(2);
          if (v in map) {
            if (!(bank in map[v])) {
              map[v][bank] = true;
            }
          } else {
            map[v] = { [bank]: true };
          }
        },
      );
  }
}

Deno.writeFile(
  join(path, "out.txt"),
  new TextEncoder().encode(
    Object.keys(map).sort((a, b) =>
      Number.parseInt(a, 16) - Number.parseInt(b, 16)
    )
      .reduce(
        (p, c) =>
          p += `__${c}: Bank${
            Object.keys(map[c]).sort((a, b) =>
              Number.parseInt(a) - Number.parseInt(b)
            ).reduce((_p, _c) => _p += `, Bank${_c}`)
          }\n`,
        "",
      ),
  ),
);
