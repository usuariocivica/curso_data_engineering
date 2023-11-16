
{{
  config(
    materialized='table'
  )
}}

WITH addresses AS (
    SELECT * 
    FROM {{ source('sql_server_dbo', 'addresses') }}
    ),

renamed_casted AS (
    SELECT
          ADDRESS_ID
        , ZIPCODE
        , COUNTRY
        , ADDRESS
        , _FIVETRAN_DELETED
        , _FIVETRAN_SYNCED
    FROM addresses
    )

SELECT * FROM renamed_casted