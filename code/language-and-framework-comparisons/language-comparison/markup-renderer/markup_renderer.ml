open Str

let render_markup text =
  let markup_tags = [
    ("\\[title\\]\\(.*?\\)\\[/title\\]", "\027[33;1m\\1\027[0m");   (* Yellow bold text *)
    ("\\[emphasis\\]\\(.*?\\)\\[/emphasis\\]", "\027[31;1m\\1\027[0m") (* Red bold text *)
  ] in
  List.fold_left (fun txt (tag, replacement) ->
    global_replace (regexp tag) replacement txt
  ) text markup_tags

let () =
  let input_filename = "input.txt" in
  try
    let content = Stdlib.(input_line (open_in input_filename)) in
    let rendered_content = render_markup content in
    print_endline rendered_content
  with Sys_error _ ->
    print_endline ("File '" ^ input_filename ^ "' not found.")
