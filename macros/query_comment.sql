{#
This macro creates a JSON comment containing dbt metadata (app, version, profile, target) 
and merges in any model-specific labels you've configured.

It enables adding FinOps labels to BigQuery jobs created by DBT. This allows easier grouping of 
queries for cost allocation.
#}

{% macro query_comment(node) %}
    {%- set comment_dict = {} -%}
    {%- do comment_dict.update(
        app='dbt',
        dbt_version=dbt_version,
        profile_name=target.get('profile_name'),
        target_name=target.get('target_name'),
    ) -%}
    {%- if node is not none -%}
      {%- do comment_dict.update(node.config.get("labels", {})) -%}
    {% else %}
      {%- do comment_dict.update(node_id='internal') -%}
    {%- endif -%}
    {% do return(tojson(comment_dict)) %}
{% endmacro %}