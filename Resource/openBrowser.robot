*** Settings ***
Library           Selenium2Library
Library           RobotAppEyes




*** Variables ***
${URL}            http://www.rangle.io
${BROWSER LOCAL}  chrome
${DELAY}          0
${INQUIRE}        css=a.header__menu-item--always-show
${INQUIRE_EYES}   a.header__menu-item--always-show
${CONTACT}        css=div.hs_phone


### Applitools Variables ###
${Applitools-url}                                   http://www.rangle.io
${Applitools-AppName}                               Rangle_Test
${Applitools-TestName}                              Rangle_RobotAppEyes_Test
${Applitools-Key}                                   mKDhcWEE1051e8V77ibwFYMsTcd4gy7AKN0SgL91n3107RQ110
${Width}                                            1024
${Height}                                           768

${OSOverride}                                       OSOverride
${BrowserOverride}                                  BrowserOverride
${MatchLevel}                                       LAYOUT
${True}                                             True


*** Keywords ***


Open Browser To Home Page(Local)
	Open Browser  ${URL}  ${BROWSER LOCAL}
	Maximize Browser Window

Open Browser To Home Page
	[Arguments]  ${BROWSER}  ${BROWSER VERSION}  ${OS}  ${OS VERSION}
	Open Browser  url=${URL}  browser=chrome  alias=None  remote_url=http://rehanarajwani1:bwrxEqELu83iJs4DsBws@hub.browserstack.com:80/wd/hub  desired_capabilities=browser:${BROWSER},browser_version:${BROWSER VERSION},os:${OS}, os_version:${OS VERSION},resolution:1680x1050
	#Maximize Browser Window

User Selects Inquire
	Element Should Be Visible  ${INQUIRE}
	Click Element  ${INQUIRE}
	Wait Until Page Contains Element  ${CONTACT}

RobotEyes Test
	Open Eyes Session  ${Applitools-url}     ${Applitools-AppName}    ${Applitools-TestName}1.0     ${Applitools-Key}      width=${Width}      height=${Height}   includeEyesLog=${True}
	Check Eyes Region  /html/body/header  1501  67  Header
	#Check Eyes Region By Element  CSS SELECTOR  ${INQUIRE_EYES}  Inquire Button
	Close Eyes Session



