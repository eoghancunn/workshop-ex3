# Instructions for coding agents

## This project
- The research question and the analysis decisions are in `PLAN.md`. Read it before doing anything else.
- Do not edit `PLAN.md`. The researcher writes it.
- Variables are described in `docs/codebook.md`.
- Write the whole pipeline as one script: `analysis/run_all.R` or `analysis/run_all.py`.
  It takes two arguments: the path to the data file and the folder to write results to.
- Test your code with `make mock`, which runs the script on `data/mock/survey_mock.csv`.
  The researcher runs `make all` on the real data.

## Analysis decisions
- Do not choose samples, exclusions, recodings, controls, models or weights yourself.
  If `PLAN.md` does not settle a decision, list it as a question with options and wait for an answer.
- Keep the code short and plain. Use standard functions (`lm` in R, `statsmodels` in Python)
  rather than writing estimators by hand.
- Do not add specifications, options or abstractions that `PLAN.md` does not ask for.

## Data
- Do not open or print rows of `data/raw/survey.csv`. Work from the codebook and the mock data.
- Do not send data to any external service or API.

## Changes and records
- Change data only inside the committed script, never with one-off shell commands.
- Install packages only through the project lockfile (renv for R, uv for Python), and say which ones you added.
- Never commit, merge or push. The researcher does that.
- Write `estimate.csv` (term, estimate, std_error, n) and `sample_flow.csv` (step, n) to the results folder,
  with numbers rounded to 3 decimal places.
