
{{
  config(
    materialized='view'
  )
}}

WITH sql_server_dbo AS (
    SELECT * 
    FROM {{ source('sql_server_dbo', 'addresses') }}
    ),

renamed_casted AS (
    SELECT
          ADDRESS_ID
        , ZIPCODE
        , COUNTRY
        , ADDRESS
        , _fivetran_synced AS date_load
    FROM sql_server_dbo
    )

SELECT * FROM renamed_casted