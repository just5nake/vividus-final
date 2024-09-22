Scenario: Check the title is correct
When I open epam homepage

Scenario: Check the ability to switch Light / Dark mode
Given I am on main application page
When I click on element located by `xpath(//div[@class='header__vaulting-container']//section[@class='theme-switcher-ui']//div[@class='theme-switcher'])`
When I wait until element located by `xpath(//body[@class='fonts-loaded light-mode'])` appears

Scenario: Check that allow to change language to UA
Given I am on main application page
When I click on element located by `xpath(//button[@class='location-selector__button'])`
When I click on element located by `xpath(//a[@class='location-selector__link' and @lang='uk'])`
Then `${current-page-url}` is equal to `https://careers.epam.ua/`
Then page title is equal to `EPAM Ukraine - найбільша ІТ-компанія в Україні | Вакансії`

Scenario: Check the policies list
Given I am on main application page
When I scroll element located by `xpath(//div[@class='footer-links']//div[@class='policies'])` into view
Then element located by `<policyItem>` exists for `PT1S` duration
Examples:
|policyItem																																				|
|xpath(//a[@class='fat-links' and @href='/investors' and text()='INVESTORS'])																			|
|xpath(//a[@class='fat-links' and @href='/cookie-policy' and text()='COOKIE POLICY'])																	|
|xpath(//a[@class='fat-links' and @href='/services/engineering/open-source' and text()='OPEN SOURCE'])													|
|xpath(//a[@class='fat-links' and @href='/applicant-privacy-notice' and text()='APPLICANT PRIVACY NOTICE'])												|
|xpath(//a[@class='fat-links' and @href='https://privacy.epam.com/core/interaction/showpolicy?type=CommonPrivacyPolicy' and text()='PRIVACY POLICY'])	|
|xpath(//a[@class='fat-links' and @href='/web-accessibility-statement' and text()='WEB ACCESSIBILITY'])													|

Scenario: Check that allow to switch location list by region
Given I am on main application page
When I click on element located by `id(onetrust-accept-btn-handler)`
When I click on element located by `className(hamburger-menu__button)`
When I click on element located by `xpath(//li[@class='hamburger-menu__item item--collapsed' and @gradient-text='Careers'])`
When I click on element located by `xpath(//a[@class='hamburger-menu__link' and @href='/careers/locations' and text()='Hiring Locations'])`
Then `${current-page-url}` is equal to `https://www.epam.com/careers/locations`
When I click on element located by `xpath(//a[@class='anchors-23__link' and @href='#americas' and text()='Americas'])`
Then element located by `xpath(//span[@class='museo-sans-light' and text()='AMERICAS'])` exists for `PT1S` duration
When I click on element located by `xpath(//a[@class='anchors-23__link' and @href='#emea' and text()='EMEA'])`
Then element located by `xpath(//span[@class='museo-sans-light' and text()='EMEA'])` exists for `PT1S` duration
When I click on element located by `xpath(//a[@class='anchors-23__link' and @href='#apac' and text()='APAC'])`
Then element located by `xpath(//span[@class='museo-sans-light' and text()='APAC'])` exists for `PT1S` duration

Scenario: Check the search function
Given I am on main application page
When I click on element located by `xpath(//button[contains(@class, 'header-search__button') and contains(@class, 'header__icon')])`
When I add `AI` to field located by `id(new_form_search)`
When I click on element located by `className(bth-text-layer)`
Then `${current-page-url}` is equal to `https://www.epam.com/search?q=AI`
Then text ` results for "AI"` exists

Scenario: Check form's fields validation
Given I am on page with URL `https://www.epam.com/about/who-we-are/contact`
When I add `#{generate(Name.firstName)}` to field located by `id(_content_epam_en_about_who-we-are_contact_jcr_content_content-container_section_section-par_form_constructor_user_first_name)`
When I add `#{generate(Name.lastName)}` to field located by `id(_content_epam_en_about_who-we-are_contact_jcr_content_content-container_section_section-par_form_constructor_user_last_name)`
When I add `#{generate(Internet.emailAddress)}` to field located by `id(_content_epam_en_about_who-we-are_contact_jcr_content_content-container_section_section-par_form_constructor_user_email)`
When I add `#{generate(PhoneNumber.subscriberNumber '10')}` to field located by `id(_content_epam_en_about_who-we-are_contact_jcr_content_content-container_section_section-par_form_constructor_user_phone)`
When I click on element located by `xpath(//span[@aria-labelledby='_content_epam_en_about_who-we-are_contact_jcr_content_content-container_section_section-par_form_constructor_user_comment_how_hear_about-label select2-_content_epam_en_about_who-we-are_contact_jcr_content_content-container_section_section-par_form_constructor_user_comment_how_hear_about-container'])`
When I click on element located by `xpath(//li[@class='select2-results__option' and contains(text(),'Industry Analyst')])`
When I click on element located by `xpath(//button[@type="submit"])`
When I click on element located by `xpath(//div[contains(@class, 'checkbox__holder') and contains(@class, 'validation-field')])`

Scenario: Check that the Company logo on the header lead to the main page
Given I am on page with URL `https://www.epam.com/about`
When I click on element located by `className(header__logo-link)`
Then `${current-page-url}` is equal to `https://www.epam.com/`

Scenario: Check that allows to download report
Given I am on page with URL `https://www.epam.com/about`
When I click on element located by `xpath(//a[@href='https://www.epam.com/content/dam/epam/free_library/EPAM_Corporate_Overview_Q4_EOY.pdf'])`
