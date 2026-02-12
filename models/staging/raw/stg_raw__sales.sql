with 

source as (

    select * from {{ source('raw', 'sales') }}

),

renamed as (

    select
        date_date,
        orders_id,
        revenue,
        pdt_id AS products_id,
        quantity

    from source

)

select * from renamed