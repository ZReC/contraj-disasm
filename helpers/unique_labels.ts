/**
 * banks0-6 share the name of some labels, this helper
 * identifies them (ignoring >BFFF) and changes their name
 * accordingly to the current bank.
 *
 * Usage: deno run --allow-read --allow-write unique_labels.ts 'folder_path'
 */
import { join } from "https://deno.land/std@0.126.0/path/mod.ts";
const path = Deno.args.at(0)?.toString() || "./";

for await (const entry of Deno.readDir(path)) {
  const bank = ((v) => v == null ? v : v[1] == "" ? 0 : v[1])(
    entry.name.match(/prg([0-9]*).asm/),
  );
  if (entry.isFile && bank) {
    const file_path = join(path, entry.name);

    const file_content = new TextDecoder().decode(
      await Deno.readFile(file_path),
    );

    Deno.writeFile(
      file_path,
      new TextEncoder().encode(file_content.replace(
        /__[0-Ba-b][0-Fa-f]{3}/g,
        (str) => str.replace("__", `_${bank}`),
      )),
    );
  }
}
