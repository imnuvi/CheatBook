

### Vagrant

Vagrant is a easy to use automated system for maintiaining virtual environments



singularity run --env OPENAI_API_KEY=<your api  key>  --env PYDANTIC_SKIP_VALIDATING_CORE_SCHEMAS='True' brad_latest.sif

singularity build brad_latest.sif docker-archive://brad_latest.tar
