# Codebook: Working Life Survey 2026

Synthetic data for the workshop. Treat it **as if it were real**: it is covered by the same rules as restricted survey data.

- File: `data/raw/survey.csv` (one row per respondent; do not modify)
- Integrity check: `data/raw.sha256` (`shasum -a 256 -c data/raw.sha256` on macOS, `sha256sum -c` on Linux)
- Safe sample for debugging: `data/mock/survey_mock.csv` (200 invented rows, same columns, no personal information)

## Missing-value codes

| Code | Meaning |
|---|---|
| `-99` | No answer |
| `-98` | Don't know / prefer not to say |

These codes appear in numeric columns.

## Variables

| Variable | Question / description | Values |
|---|---|---|
| `resp_id` | Respondent identifier | `R0001`–`R2000` |
| `age` | Age in years | Integer; -99 |
| `gender` | Gender | 1 = woman, 2 = man, 3 = non-binary / another identity, -98 |
| `sector` | Sector of main job | 1 = Public administration, 2 = Education, 3 = Health and social care, 4 = Finance and ICT, 5 = Retail and hospitality, 6 = Manufacturing |
| `tenure_years` | Years with current employer | Integer |
| `children_under12` | Any children under 12 in the household | 0 = no, 1 = yes |
| `income_band` | Gross annual personal income | 1 = under €25k, 2 = €25–35k, 3 = €35–45k, 4 = €45–60k, 5 = €60–80k, 6 = €80k+, -99 |
| `remote_days` | In a typical week, how many days do you work from home? | 0–5; -99 |
| `workload` | How would you rate your workload? | 1 = very light … 5 = very heavy |
| `job_satisfaction` | Overall, how satisfied are you with your job? | 0 = not at all … 10 = completely; -99, -98 |
| `intend_quit` | Do you intend to leave your employer in the next 12 months? | 0 = no, 1 = yes |
| `weight` | Design weight (public sector was oversampled) | Positive, mean 1 |
| `open_asked` | Was the respondent shown the open-ended question? | 0 = no, 1 = yes |
| `open_text` | What, if anything, has made your job harder in the past year? | Free text; empty if not asked or not answered |

## Notes

- `open_text` is free text written by respondents. It may contain personal information about respondents or other people.
- Routing: a random quarter of respondents were shown the open-ended question (`open_asked = 1`).
- Sampling: public administration and education were oversampled; `weight` corrects sector shares to the population.
