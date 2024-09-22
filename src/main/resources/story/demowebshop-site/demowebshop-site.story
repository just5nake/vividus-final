Scenario: Verify that allows register a User
Given I am on main application page
When I click on element located by `className(ico-register)`
When I click on element located by `#{anyOf(id(gender-male), id(gender-female))}`
When I add `#{generate(Name.firstName)}` to field located by `id(FirstName)`
When I add `#{generate(Name.lastName)}` to field located by `id(LastName)`
When I add `#{generate(Internet.emailAddress)}` to field located by `id(Email)`
When I add `${passwordUs1}` to field located by `id(Password)`
When I add `${passwordUs1}` to field located by `id(ConfirmPassword)`
When I click on element located by `id(register-button)`
Then `${current-page-url}` is equal to `https://demowebshop.tricentis.com/registerresult/1`
Then text `Your registration completed` exists
When I click on element located by `className(ico-logout)`

Scenario: Verify that allows login a User
Given I am on main application page
When I click on element located by `className(ico-login)`
When I add `${emailUs1}` to field located by `id(Email)`
When I add `${passwordUs1}` to field located by `id(Password)`
When I click on element located by `className(login-button)`
Then text `${emailUs1}` exists

Scenario: Verify that ‘Computers’ group has 3 sub-groups with correct names
Given I am on page with URL `https://demowebshop.tricentis.com/computers`
Then number of elements found by `className(sub-category-item)` is = `3`

Scenario: Verify that allows sorting items (different options)
Given I am on page with URL `https://demowebshop.tricentis.com/desktops`
Then dropdown located by `id(products-orderby)` contains options:
|value				|state	|
|Position 			|true	|
|Name: A to Z		|false	|
|Name: Z to A		|false	|
|Price: Low to High	|false	|
|Price: High to Low	|false	|
|Created on			|false	|

Scenario: Verify that allows sorting items (different options)
Given I am on page with URL `https://demowebshop.tricentis.com/desktops`
When I select `4` in dropdown located by `id(products-pagesize)`
Then number of elements found by `className(item-box)` is = `4`

Scenario: Verify that allows sorting items (different options)
Given I am on page with URL `https://demowebshop.tricentis.com/smartphone`
When I click on element located by `id(add-to-wishlist-button-43)`
Then text `The product has been added to your ` exists
When I click on element located by `xpath(//span[@class='cart-label' and text()='Wishlist'])`
When I click on element located by `xpath(//tbody//a[@href='/smartphone'])`
Then `${current-page-url}` is equal to `https://demowebshop.tricentis.com/smartphone`

Scenario: Verify that allows adding an item to the cart
Given I am on page with URL `https://demowebshop.tricentis.com/141-inch-laptop`
When I click on element located by `id(add-to-cart-button-31)`
Then text `The product has been added to your ` exists
When I click on element located by `xpath(//span[@class='cart-label' and text()='Shopping cart'])`
When I click on element located by `xpath(//tbody//a[@href='/141-inch-laptop'])`
Then `${current-page-url}` is equal to `https://demowebshop.tricentis.com/141-inch-laptop`

Scenario: Verify that allows removing an item from the cart
Given I am on page with URL `https://demowebshop.tricentis.com/cart`
When I click on element located by `name(removefromcart)`
When I click on element located by `name(updatecart)`
Then text `14.1-inch Laptop` does not exist

Scenario: Verify that allows checkout an item 
Given I am on page with URL `https://demowebshop.tricentis.com/cart`


