bundle:
	spago bundle-app --to public/app.js

dev:
	@nix-shell --run "hivemind Procfile.dev"

shell: HOST_SHELL = $$(bash -c "echo $$SHELL")
shell:
	@nix-shell --command "exec ${HOST_SHELL}"
