json.id @cart.id

json.line_items @cart.line_items do |line_item|
    json.id                 line_item.id
    json.quantity           line_item.quantity
    json.title              line_item.product.title
    json.total_price        line_item.total_price
    if (line_item == @line_item )
            json.current_item true
    end
end

json.total_price @cart.total_price
