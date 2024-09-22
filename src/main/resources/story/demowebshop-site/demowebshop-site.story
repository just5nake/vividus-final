Meta:
    @group Training
    @requirementId MyTask-0007


Scenario: Navigate to the website homepage
When I make screenshot on main application page

Scenario: Log In
When I Log in with `${swagGoodUserName}` and `${swagPassword}` creds

Scenario: Add item to the shopping cart
Given I am on page with URL `https://www.saucedemo.com/inventory.html`
When I wait until element located by `<itemPageId>` has text matching `<itemName>`
When I click on element located by `<addToCartButtonId>`
Examples:
|itemName			|itemPageId										|addToCartButtonId					|
|Sauce Labs Backpack|xpath((//div[@class='inventory_item_name'])[1])|id(add-to-cart-sauce-labs-backpack)|

Scenario: Populate checkout data
Given I am on page with URL `https://www.saucedemo.com/inventory.html`
When I click on element located by `className(shopping_cart_link)`
When I click on element located by `id(checkout)`
Given I am on page with URL `https://www.saucedemo.com/checkout-step-one.html`
When I enter `#{anyOf(#{generate(Name.firstName)}, #{generate(Name.lastName)})}` in field located by `id(first-name)`
When I enter `#{generate(regexify '[a-zA-Z]{10}')}` in field located by `id(last-name)`
When I enter `#{generate(regexify '[A-Z]{3}-[0-9]{5}')}` in field located by `id(postal-code)`
When I take screenshot
When I click on element located by `id(continue)`

Scenario: Complete checkout process
When I click on element located by `id(finish)`
Given I am on page with URL `https://www.saucedemo.com/checkout-complete.html`
When I save `innerText` attribute value of element located by `className(complete-header)` to scenario variable `tyMessage`
Given I initialize scenario variable `messageTxt` with value `#{loadResource(/data/message.txt)}`
Then `${tyMessage}` is = `${messageTxt}`
