# NeurodeskEDU tooling (local prototype)

Scripts that generate site assets for the review badge system.

## Generator

`generate_reviews_registry.py` reads review issues from the GitHub API
(or a local fixture) and writes `books/_static/reviews.json`.

### Offline (fixture) mode

```bash
python tools/generate_reviews_registry.py \
  --fixture tools/fixtures/reviews_search_issues.json \
  --out books/_static/reviews.json
```

### Live GitHub mode

```bash
export GITHUB_TOKEN=...
python tools/generate_reviews_registry.py \
  --reviews-repo neurodesk/neurodeskedu-reviews \
  --out books/_static/reviews.json
```

## Issue body metadata

Each review issue must contain an HTML comment block:

```text
<!-- nd-review
review_id: 550e8400-e29b-41d4-a716-446655440000
doi_url: https://doi.org/10.1234/example
review_commit_sha: abcdef1234567890abcdef1234567890abcdef12
reviewed_at: 2026-02-12
reviewers: reviewer-a, reviewer-b
-->
```

- `review_id` (required) — UUID generated when a notebook enters the review
  workflow. The same UUID is stored inside the notebook/page source.
- `doi_url` — optional, shown as a link on the badge.
- `review_commit_sha` — stored at acceptance; used to detect staleness.
- `reviewed_at` — date the review was accepted.
- `reviewers` — comma-separated GitHub handles.

## Labels → state

| Label              | State         |
|--------------------|---------------|
| `review:queued`    | queued        |
| `review:in-progress` | in-progress |
| `reviewed`         | reviewed      |
| `review:stale`     | stale         |
