bundle:
	spago bundle-app --to public/app.js

dev:
	@nix-shell --run "hivemind $${PORT:+--port $$PORT} --port-step 1 Procfile.dev"

shell:
	@nix-shell --command "exec $$(bash -c "echo $$SHELL")"
