r_version = ocx.run("task", "--version")
expect.ok(r_version)
expect.eq(r_version.exit_code, 0)
expect.contains(r_version.stdout, "Task version:")

ocx.write_file("Taskfile.yml", "version: '3'\ntasks:\n  hello:\n    cmds:\n      - echo greetings\n")
r_list = ocx.run("task", "--list-all")
expect.eq(r_list.exit_code, 0)
expect.contains(r_list.stdout, "hello")

r_run = ocx.run("task", "hello")
expect.eq(r_run.exit_code, 0)
expect.contains(r_run.stdout, "greetings")
