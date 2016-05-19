use pizza;
go
Create view menu 
     (name, size, price) as
     select rtrim(ltrim(ProductName)), 
            rtrim(ltrim(ProductUnitSize)),
		    rtrim(ltrim(ProductUnitPrice))
     from Product;
go

select *
from menu
for xml auto, elements;