select 
    o.order_key,
    o.order_status,
    o.order_total,
    o.order_date,
    o.order_month,
    l.order_unique_items,
    l.order_total_quantity,
    c.customer_key,
    c.customer_name,
    n.customer_nation
    
from {{ ref('stg_sample__orders') }} as o 
    
    inner join {{ ref('int_sample__orders_joined_lines') }} l 
        on l.order_key = o.order_key 

    inner join {{ ref('stg_sample__customer') }} c 
        on c.customer_key = o.customer_key

    inner join {{ ref('stg_sample__nation') }} as n 
        on n.nation_key = c.nation_key