# Analysis plan

Written by the researcher before any code. The agent reads this file but does not edit it.
Items marked **[OPEN]** are for you to fill in before you start the agent (Exercise 3, step 1).

## Question
Does working from home affect job satisfaction?

## Estimand
The total effect of one additional remote working day per week on job satisfaction (0–10),
for the population of employees that the survey weights represent.

## Data
- `data/raw/survey.csv`, described in `docs/codebook.md`
- While developing, use `data/mock/survey_mock.csv` (same columns, invented rows)

## Sample
- **[OPEN]** Which respondents are excluded, and why? (For example: implausible ages, values outside the scale.)

## Variables
- Outcome: `job_satisfaction`, 0–10, treated as continuous
- Treatment: `remote_days`, 0–5 days per week, entered as a number
- Missing-value codes: **[OPEN]** How are −99 and −98 handled?

## Model
- Linear regression of the outcome on the treatment
- Control variables: **[OPEN]** Which variables, and why each one?
- Weights: use the design weight `weight`
- Standard errors: robust (HC1)

## Outputs
- `results/estimate.csv`: term, estimate, std_error, n (rounded to 3 decimal places)
- `results/sample_flow.csv`: the number of rows after each step

## Confirmatory and exploratory
The specification above is the confirmatory analysis. Anything else is exploratory and is labelled as such.

## Decision register
Add a row for every decision, including ones the agent asked about and defaults you accepted.

| Decision | Choice | Decided by | Commit |
|---|---|---|---|
| Estimand | Total effect of one more remote day | Researcher, in advance | (this commit) |
| Weights | Design weight | Researcher, in advance | (this commit) |
| Standard errors | Robust (HC1) | Researcher, in advance | (this commit) |
| | | | |
