package si.nlb.testautomation.NLBTestAutomation.Test;
import com.sun.org.apache.bcel.internal.generic.Select;
import org.openqa.selenium.TimeoutException;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import si.nlb.testautomation.NLBTestAutomation.Action.*;
import si.nlb.testautomation.NLBTestAutomation.Helpers.Utilities;
import si.nlb.testautomation.NLBTestAutomation.JS.JSHelpers;
import si.nlb.testautomation.NLBTestAutomation.Selectors.*;
import si.nlb.testautomation.NLBTestAutomation.Wait.WaitHelpers;
import si.nlb.testautomation.NLBTestAutomation.Core.Base;
import si.nlb.testautomation.NLBTestAutomation.Data.DataManager;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import javax.xml.crypto.Data;
import java.awt.datatransfer.UnsupportedFlavorException;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.SQLOutput;
import java.text.*;
import java.time.LocalDate;
import java.time.YearMonth;
import java.time.format.TextStyle;
import java.util.*;
import java.util.stream.Collectors;

import static org.junit.Assert.*;
import static si.nlb.testautomation.NLBTestAutomation.Core.Base.driver;

public class Steps {
    //region - Parameters -
    ActionApiHelpers hp = new ActionApiHelpers();
    RoutineHelper rh = new RoutineHelper();
    HTTPAction ha = new HTTPAction();
    MobileAction ma = new MobileAction();
    Base b = new Base();
    //endregion - Parameters -

    //region - Basic methods -
    @Given("Open Login page")
    public void openLoginPage() {
        //String url = DataManager.testWebSite;
        String url = DataManager.getDataFromConfiguration("1", "WebSite");
        ActionApiHelpers.OpenURL(url);
    }

    @Given("Open {string} page")
    public void openPage(String webAddress) {
        ActionApiHelpers.OpenURL(webAddress);
    }

    @And("Breakpoint")
    public void breakpoint() {
        WaitHelpers.waitForSeconds(1);
    }

    @And("Wait for {string} seconds")
    public void waitForSeconds(String timeText) {
        int sec = Integer.parseInt(timeText);
        WaitHelpers.waitForSeconds(sec);
    }

    @Then("Switch to active window")
    public void switchToActiveWindow() {
        hp.switchToWindow();
    }

    @And("Scroll screen down")
    public void scrollScreenDown() {
        JSHelpers.scrollScreenDown();
    }

    @And("Scroll screen up")
    public void scrollScreenUp() {
        JSHelpers.scrollScreenUp();
    }


    @When("Scroll screen {string} down")
    public void scrollScreenDown(String number) {
        int n = Integer.parseInt(number);
        JSHelpers.scrollScreenDown(n);
    }

    @When("Scroll screen {string} up")
    public void scrollScreenUp(String number) {
        int n = Integer.parseInt(number);
        JSHelpers.scrollScreenUp(n);
    }

    @And("Save from Excel {string} columnName {string}")
    public void saveFromExcelColumnName(String rowIndex, String columnName) {
        String text = DataManager.getDataFromHashDatamap(rowIndex, columnName);
        DataManager.userObject.put(columnName, text);
    }
    //endregion - Basic methods -

    //region - Enter text methods -
    @Then("Enter text from Excel {string} columnName {string} in element by class {string} save parameter")
    public void enterTextFromExcelColumnNameInInput(String rowindex, String columnName, String elementName) throws Throwable {
        String text = DataManager.getDataFromHashDatamap(rowindex, columnName);
        DataManager.userObject.put(columnName, text);
        WebElement element = SelectByClassName.CreateElementByClassName(elementName);
        ActionApiHelpers.EnterTextToElementWithClick(element, text);
    }

    @And("Enter text from Excel {string} columnName {string} in field class {string}")
    public void enterTextFromExcelColumnNameInFieldClass(String rowIndex, String columnName, String className) throws Throwable {
        String text = DataManager.getDataFromHashDatamap(rowIndex, columnName);
        WebElement element = SelectByClassName.CreateElementByClassName(className);
        hp.EnterTextToElementWithClick(element, text);
    }

    @And("Enter text from Excel {string} columnName {string} in field name {string}")
    public void enterTextFromExcelColumnNameInFieldName(String rowIndex, String columnName, String nameName) throws Throwable {
        String text = DataManager.getDataFromHashDatamap(rowIndex, columnName);
        WebElement element = SelectByName.CreateElementByName(nameName);
        hp.EnterTextToElementWithClick(element, text);
    }

    @And("Enter text {string} in field by name {string}")
    public void enterTextInFieldByName(String text, String nameName) throws Throwable {
        WebElement element = SelectByName.CreateElementByName(nameName);
        hp.EnterTextToElementWithClick(element, text);
    }

    @And("Enter text {string} in field by class {string}")
    public void enterTextInFieldByClass(String text, String className) throws Throwable {
        WebElement element = SelectByClassName.CreateElementByClassName(className);
        hp.EnterTextToElementWithClick(element, text);
    }

    @And("Enter text {string} in field by class {string} and press enter")
    public void enterTextInFieldByClassAndPressEnter(String text, String className) throws Throwable {
        WebElement element = SelectByClassName.CreateElementByClassName(className);
        text = text + "\n";
        hp.EnterTextToElementWithClick(element, text);
    }

    @And("Enter text {string} in field by data-bind {string}")
    public void enterTextInFieldByDataBind(String text, String dataBind) throws Throwable {
        WebElement element = SelectByXpath.createElementByDataBind(dataBind);
        hp.EnterTextToElementWithClick(element, text);
    }
    //endregion - Enter text methods -

    //region - Click -
    @Then("Click on element by id {string}")
    public void clickOnElementById(String Id) throws Throwable {
        WebElement element = SelectById.CreateElementById(Id);
        hp.ClickOnElement(element, Id);
    }

    @Then("Click on element by text {string}")
    public void clickOnElementByText(String text) throws Throwable {
        WebElement element = SelectByText.CreateElementByXpathText(text);
        hp.ClickOnElement(element, text);
    }

    @Then("Click on span text {string}")
    public void clickOnSpanText(String text) throws Throwable {
        WebElement element = SelectByText.createElementByXpathSpanText(text);
        hp.ClickOnElement(element, text);
    }

    @Then("Click on element by text {string} index {string}")
    public void clickOnElementByTextIndex(String text, String index) throws Throwable {
        WebElement element = SelectByText.CreateElementByXpathIndex(text, index);
        hp.ClickOnElement(element, text);
    }

    @And("Click on element by text {string} if exists")
    public void clickOnElementByTextIfExists(String text) {
        try {
            WebElement element = SelectByText.CreateElementByXpathText(text);
            hp.ClickOnElement(element, text);
        } catch (Throwable ex) {
        }
    }

    @And("Click on element by name {string}")
    public void clickOnElementByName(String elementName) throws Throwable {
        WebElement element = SelectByName.CreateElementByName(elementName);
        hp.ClickOnElement(element, elementName);
    }

    @And("Click on element by data bind {string}")
    public void clickOnElementByDataBind(String dataBind) throws Throwable {
        WebElement element = SelectByXpath.createElementByDataBind(dataBind);
        hp.ClickOnElement(element, dataBind);
    }

    @When("Click on element by class {string}")
    public void clickOnElementByClass(String className) throws Throwable {
        WebElement element = SelectByClassName.CreateElementByClassName(className);
        hp.ClickOnElement(element, className);
    }
    //endregion - Click -

    //region - Select -
    @And("Select visible text {string} by element name {string}")
    public void selectTextByElementName(String text, String elementName) throws Throwable {
        WebElement element = SelectByName.CreateElementByName(elementName);
        hp.SelectByValue(element, text);
    }

    @And("Select value {string} by element name {string}")
    public void selectValueByName(String value, String elementName) throws Throwable {
        WebElement element = SelectByName.CreateElementByName(elementName);
        hp.SelectByValue(element, value);
    }

    @And("Select index {string} by element name {string}")
    public void selectIndexByName(String text, String elementName) throws Throwable {
        WebElement element = SelectByName.CreateElementByName(elementName);
        int index = Integer.parseInt(text);
        hp.SelectByIndex(element, index);
    }
    //endregion - Select -

    //region - Click -
    @And("Assert element by name {string} is enabled")
    public void assertElementByNameIsEnabled(String nameName) throws Throwable {
        WebElement element = SelectByName.CreateElementByName(nameName);
        assertTrue(element.isEnabled());
    }

    @And("Assert element by name {string} is displayed")
    public void assertElementByNameIsDisplayed(String elementName) throws Throwable {
        WebElement element = SelectByName.CreateElementByName(elementName);
        assertTrue(element.isDisplayed());
    }

    @And("Assert element by value {string}")
    public void assertElementByValue(String value) throws Throwable {
        WebElement element = SelectByXpath.CreateSelectorByXpathValue(value);
        assertTrue(element.isEnabled());
    }

    @And("Assert element by data-bind {string}")
    public void assertElementByDataBind(String dataBind) throws Throwable {
        WebElement element = SelectByXpath.createElementByDataBind(dataBind);
        assertTrue(element.isDisplayed());
    }

    @Then("Assert element by text {string}")
    public void assertByText(String text) throws Throwable {
        By elWait = SelectByText.CreateByElementByText(text);
        WaitHelpers.WaitForElement(elWait);

        hp.assertElementByText(text);
    }

    @Then("Assert element by class {string}")
    public void assertElementByClass(String className) throws Throwable {
        By elWait = SelectByClassName.CreateByElementByClassName(className);
        WaitHelpers.WaitForElement(elWait);

        WebElement element = SelectByClassName.CreateElementByClassName(className);
        assertTrue(element.isDisplayed());
    }

    @Then("Assert element by class {string} with hoover")
    public void assertElementByClassWithHoover(String className) throws Throwable {
        WebElement element = SelectByClassName.CreateElementByClassName(className);
        hp.HoverWithoutClickElement(element);
        assertTrue(element.isDisplayed());
    }

    @Then("Assert element by id {string}")
    public void assertElementById(String elementId) throws Throwable {
        By elWait = SelectById.CreateByElementById(elementId);
        WaitHelpers.WaitForElement(elWait);

        WebElement element = SelectById.CreateElementByXpath(elementId);
        assertTrue(element.isDisplayed());
    }
    //endregion - Assert -

    @And("Enter text {string} in field by id {string}")
    public void enterTextInFieldById(String text, String elementId) throws Throwable {
        WebElement element = SelectById.CreateElementById(elementId);
        hp.EnterTextToElementWithClick(element, text);
    }

    @Then("Assert element by id {string} and text {string}")
    public void assertElementByIdAndText(String elementId, String text) throws Throwable {
        WebElement element = SelectById.CreateElementById(elementId);
        String value = hp.getInnerText(element);
        assertTrue(text.equals(value));
    }

    @When("Enter text from Excel {string} columnName {string} in field id {string}")
    public void enterTextFromExcelColumnNameInFieldId(String rowIndex, String columnName, String elementId) throws Throwable {
        String text = DataManager.getDataFromHashDatamap(rowIndex, columnName);
        WebElement element = SelectById.CreateElementById(elementId);
        hp.EnterTextToElementWithClick(element, text);
    }

    @And("Enter text {string} in field class {string} and descendant input id {string}")
    public void enterTextInFieldClassAndDescendantInputId(String text, String xClass, String descendantId) throws Throwable {
        WebElement element = SelectByXpath.CreateElementByXpathClassAndDescendantInputId(xClass, descendantId);
        hp.EnterTextToElement(element, text);
    }

    @And("Click on element from Excel {string} contains text columnName {string}")
    public void clickOnElementFromExcelContainsTextColumnName(String rowIndex, String columnName) throws Throwable {
        String text = DataManager.getDataFromHashDatamap(rowIndex, columnName);
        WebElement element = SelectByXpath.CreateElementByXpathTagContainsText("*", text);
        hp.ClickOnElement(element);
    }

    @And("Click on element from Excel {string} contains only text columnName {string}")
    public void clickOnElementFromExcelContainsOnlyTextColumnName(String rowIndex, String columnName) throws Throwable {
        String text = DataManager.getDataFromHashDatamap(rowIndex, columnName);
        WebElement element = SelectByXpath.CreateElementByXpathTagContainsText("*", text);
        hp.ClickOnElement(element);
    }

    @And("Scroll element id {string} into view")
    public void scrollElementIdIntoView(String id) throws Throwable {
        WebElement element = SelectById.CreateElementById(id);
        JSHelpers.ScrollIntoView(element);
    }


    @And("Scroll element attribute {string} and value {string} into view")
    public void scrollElementAttributeAndValueIntoView(String attribute, String value) throws Throwable {
        WebElement element = SelectByAttribute.CreateElementByXpath(attribute, value);
        JSHelpers.ScrollIntoView(element);
    }


    @And("Click on element by attribute {string} and value {string}")
    public void clickOnElementByAttributeAndValue(String attribute, String value) throws Throwable {
        WebElement element = SelectByAttribute.CreateElementByXpath(attribute, value);
        hp.ClickOnElement(element);
    }

    @And("Click on element by attribute {string} and value {string} fast")
    public void clickOnElementByAttributeAndValueFast(String attribute, String value) throws Throwable {
        WebElement element = SelectByAttribute.CreateElementByXpath(attribute, value);
        hp.ClickOnElementFast(element);
    }

    @And("Hover over element with id {string}")
    public void hoverOverElementWithClass(String id) throws Throwable {
        WebElement element = SelectById.CreateElementById(id);
        hp.HoverElement(element);
    }

    @Then("Click on element by text {string} and has ancestor {string}")
    public void clickOnElementByTextAndHasAncestor(String text, String ancestorTag) throws Throwable {
        WebElement element = SelectByXpath.CreateElementByXpathTagContainsTextAndHasAncestor(text, ancestorTag);
        hp.ClickOnElement(element);
    }


    @And("Assert element by class {string} is clickable")
    public void assertElementByClassIsClickable(String className) throws Throwable {
        WebElement element = SelectByClassName.CreateElementByClassName(className);
        hp.isClickable(element);
    }

    @And("Assert element by xPath class {string} is clickable")
    public void assertElementByXpathClassIsClickable(String className) throws Throwable {
        WebElement element = SelectByXpath.CreateElementByXpathClassName(className);
        hp.isClickable(element);
    }

    @And("Assert element by text {string} is clickable")
    public void assertElementByTextIsClickable(String text) throws Throwable {
        WebElement element = SelectByText.CreateElementByXpathText(text);
        hp.isClickable(element);
    }

    @And("Assert element by class {string} and descendant button is clickable")
    public void assertElementByClassAndDescendantButtonIsClickable(String className) throws Throwable {
        WebElement element = SelectByXpath.CreateElementByXpathClassAndDescendantButton(className);
        hp.isClickable(element);
    }

    @And("Assert element by class {string} and ancestor button is clickable")
    public void assertElementByClassAndAncestorButtonIsClickable(String className) throws Throwable {
        WebElement element = SelectByXpath.CreateElementByXpathClassAndAncestorButton(className);
        hp.isClickable(element);
    }

    @And("Assert element by tag {string} containing text {string} is clickable")
    public void assertElementByTagContainingTextIsClickable(String tag, String text) throws Throwable {
        WebElement element = SelectByTagName.CreateElementByTextInTag(tag, text);
        hp.isClickable(element);
    }

    @And("Assert element by class {string} and descendant {string} is clickable")
    public void assertElementByClassAndDescendantIsClickable(String className, String descendantTag) throws Throwable {
        WebElement element = SelectByXpath.CreateElementByXpathClassAndDescendantTag(className, descendantTag);
        hp.isClickable(element);
    }

    @When("Click on element by title {string}")
    public void clickOnElementByTitle(String titleValue) throws Throwable {
        WebElement element = SelectByXpath.CreateElementByXpathTitle(titleValue);
        hp.ClickOnElement(element, titleValue);
    }

    @And("Click on button {string}")
    public void clickOnButton(String buttonName) throws Throwable {
        String tag = "button";
        WebElement element = SelectByXpath.CreateElementByXpathTagContainsText(tag, buttonName);
        hp.ClickOnElementFast(element);
    }

    @And("Click on button {string} slow")
    public void clickOnButtonSlow(String buttonName) throws Throwable {
        String tag = "button";
        WebElement element = SelectByXpath.CreateElementByXpathTagContainsText(tag, buttonName);
        hp.ClickOnElement(element);
    }

    @And("Assert element by contains text {string}")
    public void assertElementByContainsText(String text) throws Throwable {
        String xPath = "//*[contains(text(),'" + text + "')]";
        By waitEl = SelectByXpath.CreateByElementByXpath(xPath);
        WaitHelpers.WaitForElement(waitEl);

        WebElement element = SelectByXpath.CreateElementByXpathContainingText(text);
        assertTrue(element.isDisplayed());
    }


    @And("Assert element by class {string} containing text {string}")
    public void assertElementByClassContainingText(String className, String text) throws Throwable {
        WebElement element = SelectByXpath.CreateElementByXpathClassContainsText(className, text);
        assertTrue(element.isDisplayed());
    }

    @And("Click on element by containing text {string}")
    public void clickOnElementByContainingText(String text) throws Throwable {
        WebElement element = SelectByXpath.CreateElementByXpathContainingText(text);
        hp.ClickOnElement(element);
    }

    @And("Click on element by tag name {string}")
    public void clickOnElementByTagName(String tagName) throws Throwable {
        WebElement element = SelectByXpath.CreateElementByXpathTag(tagName);
        hp.ClickOnElement(element);
    }

    @And("Send key Backspace {int} times in field by id {string}")
    public void sendKeyBackspaceTimesInFieldById(int n, String id) throws Throwable {
        String key = "BACK_SPACE";
        WebElement element = SelectById.CreateElementById(id);
        rh.sendKeyNTimes(element, n, key);
    }

    @And("Click fast on element by attribute {string} and value {string}")
    public void clickFastOnElementByAttributeAndValue(String attribute, String value) throws Throwable {
        WebElement element = SelectByAttribute.CreateElementByXpath(attribute, value);
        hp.ClickOnElementFast(element);
    }

    @And("Remove text from a field by id {string}")
    public void removeTextFromAFieldById(String id) throws Throwable {
        WebElement element = SelectById.CreateElementById(id);
        hp.deleteTextFromField(element);
    }

    @And("Send key Backspace in field by id {string} till all is deleted")
    public void sendKeyBackspaceInFieldByIdStringTillAllIsDeleted(String id) throws Throwable {
        String key = "BACK_SPACE";
        WebElement element = SelectById.CreateElementById(id);
        int n = element.getAttribute("value").length();
        rh.sendKeyNTimes(element, n, key);
    }

    @Then("Send key Backspace in field by name {string} till all is deleted")
    public void sendKeyBackspaceInFieldByNameTillAllIsDeleted(String name) throws Throwable {
        String key = "BACK_SPACE";
        WebElement element = SelectByName.CreateElementByName(name);
        int n = element.getAttribute("value").length();
        rh.sendKeyNTimes(element, n, key);
    }

    @And("Click on element {int} by text {string}")
    public void clickOnElementByText(int index, String text) throws Throwable {
        WebElement element = SelectByXpath.CreateElementByXpathTextWithIndex(index, text);
        hp.ClickOnElement(element);
    }

    @And("Enter text {string} in field by text {string} has sibling input")
    public void enterTextStringInFieldByTextHasSiblingInput(String fromText, String text) throws Throwable {
        WebElement element = SelectByXpath.CreateElementByXpathContainsTextAndHasSiblingInput(text);
        hp.EnterTextToElement(element, fromText);
    }

    @And("Click on element by tag {string} containing text {string}")
    public void clickOnElementByTagContainingText(String tag, String text) throws Throwable {
        WebElement element = SelectByXpath.CreateElementByXpathTagContainsText(tag, text);
        hp.ClickOnElement(element);
    }

    @And("Click on element by tag {string} and contains text {string}")
    public void clickOnElementByTagAndContainsText(String tag, String text) throws Throwable {
        WebElement element = SelectByTagName.CreateElementByTextInTag(tag, text);
        hp.ClickOnElementFast(element, "Ovde smo kliknuli");
    }

    @And("Click on element by class xpath {string} and appears first")
    public void clickOnElementByClassXpathAndAppearsFirst(String className) throws Throwable {
        WebElement element = SelectByClassName.CreateElementByXpathClassFirstOnly(className);
        JSHelpers.ScrollIntoViewBottom(element);
        hp.ClickOnElement(element);
    }

    @And("Remember attribute {string} inside class {string} that has descendant tag {string} with class {string} under key {string}")
    public void rememberAttributeInsideClassThatHasDescendantTagWithClassUnderKey(String attribute, String classNameAncestor, String descendantTag, String classNameDescendant, String key) throws Throwable {
        WebElement element = SelectByXpath.CreateElementByXpathClassAndDescendantTagWithClass(classNameAncestor, descendantTag, classNameDescendant);
        String content = element.getAttribute(attribute);

        hp.saveTheValueToMapBasic(content, key);
    }

    @And("Check if elements by class {string} have {string} in alphabetical order")
    public void checkIfElementsByClassHaveInAlphabeticalOrder(String className, String attribute) throws Throwable {
        rh.assertElementsByClassHaveInAlphabeticalOrder(className, attribute);
    }

    @And("Assert element by id {string} is not enabled")
    public void assertElementByIdIsNotEnabled(String id) throws Throwable {
        WebElement element = SelectById.CreateElementById(id);
        assertTrue(element.isEnabled());
    }

    @And("Compare attribute value {string} in xPath {string} to value under key {string}")
    public void compareAttributeValueInXPathToValueUnderKey(String attribute, String xPath, String key) throws Throwable {
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertEquals(element.getAttribute(attribute), DataManager.userObject.get(key));
    }

    @And("Compare attribute value {string} in class {string} to value under key {string}")
    public void compareAttributeValueInClassToValueUnderKey(String attribute, String xPath, String key) throws Throwable {
        WebElement element = SelectByClassName.CreateElementByClassName(xPath);
        assertEquals(element.getAttribute(attribute), DataManager.userObject.get(key));
    }

    @And("Assert element by id {string} is enabled")
    public void assertElementByIdIsEnabled(String id) throws Throwable {
        By waitEl = SelectById.CreateByElementById(id);
        WaitHelpers.WaitForElement(waitEl);

        WebElement element = SelectById.CreateElementById(id);
        hp.assertElementIsEnabled(element);
    }

    @And("Assert element by xPath class {string}")
    public void assertElementByXPathClass(String className) throws Throwable {
        SelectByClassName.CreateElementByXpath(className);
    }

    @And("Scroll element by xpath {string} into view")
    public void scrollElementByXpathIntoView(String xpath) throws Throwable {
        WebElement element = SelectByXpath.CreateElementByXpath(xpath);
        JSHelpers.ScrollIntoView(element);
    }

    @And("Remember attribute {string} in xPath {string} under key {string}")
    public void rememberAttributeInXPathUnderKey(String attribute, String xPath, String key) throws Throwable {
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        hp.saveTheValueToMapBasic(element.getAttribute(attribute), key);
    }

    @And("Remember attribute {string} in class {string} under key {string}")
    public void rememberAttributeInClassUnderKey(String attribute, String className, String key) throws Throwable {
        WebElement element = SelectByClassName.CreateElementByXpath(className);
        hp.saveTheValueToMapBasic(element.getAttribute(attribute), key);
    }

    @And("Click on element by xpath {string}")
    public void clickOnElementByXpath(String xPath) throws Throwable {
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Assert element by tag {string} containing text {string}")
    public void assertElementByTagContainingText(String tag, String text) throws Throwable {
        String xPath = "//" + tag + "[contains(text(),'" + text + "')]";
        By elWait = SelectByXpath.CreateByElementByXpath(xPath);
        WaitHelpers.WaitForElement(elWait);

        WebElement element = SelectByTagName.CreateElementByTextInTag(tag, text);
        assertTrue(element.isDisplayed());
    }

    @And("Click on first element with class {string}")
    public void clickOnFirstElementWithClass(String className) throws Throwable {
        WebElement element = rh.getElementByClassAndIndex(className, 0);
        hp.ClickOnElement(element);
    }

    @And("Click on element by class xpath {string}")
    public void clickOnElementByClassXpath(String xClass) throws Throwable {
        WebElement element = SelectByXpath.CreateElementByXpathClassName(xClass);
        hp.ClickOnElement(element);
    }

    @And("Check if searched text {string} exists in list of elements with class {string}")
    public void checkIfSearchedTextExistsInListOfElementsWithClass(String searchedText, String className) throws Throwable {
        rh.assertSearchedTextExistsInListOfElementsWithClass(searchedText, className);
    }

    @Then("Click on element by class {string} and descendant button")
    public void clickOnElementByClassAndDescendantButton(String className) throws Throwable {
        WebElement element = SelectByXpath.CreateElementByXpathClassAndDescendantButton(className);
        hp.ClickOnElement(element);
    }

    @And("Assert button {string} is not clickable")
    public void assertButtonIsNotClickable(String buttonName) throws Throwable {
        WebElement element = SelectByXpath.CreateElementByXpathTagContainsText("button", buttonName);
        assertFalse(element.isEnabled());
    }

    @And("Click {string} on element with id {string}")
    public void clickOnElementWithId(String buttonName, String elementId) throws Throwable {
        WebElement element = SelectById.CreateElementById(elementId);
        hp.pressAButton(element, buttonName);
    }

    @And("Assert element by class {string} is not clickable")
    public void assertElementByClassIsNotClickable(String className) throws Throwable {
        WebElement element = SelectByXpath.CreateElementByXpathContainingClass(className);
        assertTrue(element.isDisplayed());
        hp.ClickOnElement(element);
        assertTrue(element.isDisplayed());
    }

    @And("Assert element by contains class {string}")
    public void assertElementByContainsClass(String className) throws Throwable {
        By elWait = SelectByClassName.CreateByElementByContainsClassName(className);
        WaitHelpers.WaitForElement(elWait);

        WebElement element = SelectByXpath.CreateElementByXpathContainingClass(className);
        assertTrue(element.isDisplayed());
    }

    @And("Click on element by containing class {string}")
    public void clickOnElementByContainingClass(String className) throws Throwable {
        WebElement element = SelectByXpath.CreateElementByXpathContainingClass(className);
        hp.ClickOnElement(element);
    }

    @And("Assert selected creditor country is {string}")
    public void assertSelectedCreditorCountryIs(String country) throws Throwable {
        WebElement element = SelectByXpath.CreateElementByXpath("(//*[contains(@class, 'dropdown-select-search-input')])[1]");
        String actualCountry = (element.getAttribute("value")).replaceAll(" *$", "");
        assertTrue(country.equals(actualCountry));
    }

    @And("Assert selected bank country is {string}")
    public void assertSelectedBankCountryIs(String bankCountry) throws Throwable {
        WebElement element = SelectByXpath.CreateElementByXpath("(//*[contains(@class, 'dropdown-select-search-input')])[2]");
        String actualCountry = (element.getAttribute("value")).replaceAll(" *$", "");
        assertTrue(bankCountry.equals(actualCountry));
    }

    @And("Remember text of element with class {string} under the key {string}")
    public void rememberTextOfElementWithClassUnderTheKey(String className, String key) throws Throwable {
        WebElement element = SelectByClassName.CreateElementByClassName(className);
        String text = element.getText();
        hp.saveTheValueToMapBasic(text, key);
    }

    @And("Scroll element id {string} into bottom view")
    public void scrollElementIdIntoBottomView(String id) throws Throwable {
        WebElement element = SelectById.CreateElementById(id);
        JSHelpers.ScrollIntoViewBottom(element);
    }

    @And("Assert element by contains class {string} containing text {string}")
    public void assertElementByContainsClassContainingText(String className, String text) throws Throwable {
        String xPath = "//*[contains(@class,'" + className + "') and contains (text(), '" + text + "')]";
        By waitEl = SelectByXpath.CreateByElementByXpath(xPath);
        WaitHelpers.WaitForElement(waitEl);

        WebElement element = SelectByXpath.CreateElementByXpathContainsClassContainingText(className, text);
        assertTrue(element.isDisplayed());
    }

    @And("Assert element by contains class {string} with descendant tag {string} containing text {string}")
    public void assertElementByContainsClassWithDescendantTagContainingText(String className, String tag, String text) throws Throwable {
        String xPath = "//*[contains(@class,'" + className + "')]//descendant::" + tag + "[contains(text(),'" + text + "')]";
        By waitEl = SelectByXpath.CreateByElementByXpath(xPath);
        WaitHelpers.WaitForElement(waitEl);

        WebElement element = SelectByClassName.CreateElementByXpathContainsClassWithDescendantTagContainingText(className, tag, text);
        assertTrue(element.isDisplayed());
    }


    @And("Click on element by contains class {string} with descendant tag {string} with id {string}")
    public void clickOnElementByContainsClassWithDescendantTagWithId(String className, String tag, String id) throws Throwable {
        WebElement element = SelectByClassName.CreateElementByXpathContainsClassWithDescendantTagWithId(className, tag, id);
        hp.ClickOnElement(element);
    }

    @And("Click on element by contains class {string} with descendant tag {string} with class {string}")
    public void clickOnElementByContainsClassWithDescendantTagWithClass(String className, String tag, String descendantClassName) throws Throwable {
        WebElement element = SelectByClassName.CreateElementByXpathContainsClassWithDescendantTagWithClass(className, tag, descendantClassName);
        hp.ClickOnElement(element);
    }

    @And("Compare attribute {string} in class {string} to value under key {string}")
    public void compareAttributeInClassToValueUnderKey(String attribute, String className, String key) throws Throwable {
        WebElement element = SelectByClassName.CreateElementByXpath(className);
        assertEquals(element.getAttribute(attribute), DataManager.userObject.get(key));
    }

    @Then("Compare attribute {string} in id {string} to value under key {string}")
    public void compareAttributeInIdToValueUnderKey(String attribute, String id, String key) throws Throwable {
        WebElement element = SelectById.CreateElementByXpath(id);
        assertEquals(element.getAttribute(attribute), DataManager.userObject.get(key));
    }

    @And("Click on element by id {string} and descendant tag {string} with class {string}")
    public void clickOnElementByIdAndDescendantTagWithClass(String id, String tag, String className) throws Throwable {
        WebElement element = SelectById.CreateElementByIdAndDescendantTagWithClass(id, tag, className);
        hp.ClickOnElement(element);
    }

    @And("Scroll button {string} into view")
    public void scrollButtonIntoView(String button) throws Throwable {
        WebElement element = SelectByXpath.CreateElementByXpathTagContainsText("button", button);
        JSHelpers.ScrollIntoViewBottom(element);
    }

    @And("Scroll element by contains text {string} into bottom view")
    public void scrollElementByContainsTextIntoBottomView(String text) throws Throwable {
        WebElement element = SelectByText.CreateElementByXpathContainingText(text);
        JSHelpers.ScrollIntoViewBottom(element);
    }

    @And("Scroll element by contains text {string} into view")
    public void scrollElementByContainsTextIntoView(String text) throws Throwable {
        WebElement element = SelectByText.CreateElementByXpathContainingText(text);
        JSHelpers.ScrollIntoView(element);
    }

    @And("Assert element by class {string} and contains text {string}")
    public void assertElementByClassAndContainsText(String className, String text) throws Throwable {
        String xPath = "//*[@class='" + className + "' and contains(text(), '" + text + "')]";
        By waitEl = SelectByXpath.CreateByElementByXpath(xPath);
        WaitHelpers.WaitForElement(waitEl);

        WebElement element = SelectByXpath.CreateElementByXpathClassAndContainsText(className, text);
        assertTrue(element.isDisplayed());
    }

    @And("Remember value of element by id {string} under key {string}")
    public void rememberValueOfElementByIdUnderKey(String id, String key) throws Throwable {
        WebElement element = SelectById.CreateElementById(id);
        hp.saveTheValueToMapBasic(element.getAttribute("value"), key);
    }

    @And("Assert element by class {string} and contains text {string} has remembered value from excel {string} columnName {string}")
    public void assertElementByClassAndContainsTextHasRememberedValueFromExcelColumnName(String className, String text, String rowindex, String columnName) throws Throwable {
        String expectedAccountNumber = DataManager.getDataFromHashDatamap(rowindex, columnName);
        WebElement element = SelectByXpath.CreateElementByXpathClassAndContainsText(className, text);
        String actualAccountNumber = element.getAttribute("innerText");
        assertEquals(expectedAccountNumber, actualAccountNumber);
    }

    @And("Assert element by label with text content {string} that has sibling has remembered value from excel {string} columnName {string}")
    public void assertElementByLabelWithTextContentThatHasSiblingHasRememberedValueFromExcelColumnName(String text, String rowindex, String columnName) throws Throwable {
        String expected = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPath = "//label[contains(text(),'" + text + "')]//following-sibling::*[1]";
        By waitEl = SelectByXpath.CreateByElementByXpath(xPath);
        WaitHelpers.WaitForElement(waitEl);

        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String actual = element.getAttribute("innerText");
        assertEquals(expected, actual);
    }

    @And("Assert element by class {string} and contains text {string} has text remembered under key {string}")
    public void assertElementByClassAndContainsTextHasTextRememberedUnderKey(String className, String text, String key) throws Throwable {
        WebElement element = SelectByXpath.CreateElementByXpathClassAndContainsText(className, text);
        String actualValue = element.getAttribute("innerText");
        String expectedValue = DataManager.userObject.get(key).toString();
        assertEquals(actualValue, expectedValue);
    }

    @And("Assert element by label with text content {string} that has sibling has text remembered under key {string}")
    public void assertElementByLabelWithTextContentThatHasSiblingHasTextRememberedUnderKey(String text, String key) throws Throwable {
        String xPath = "//label[contains(text(),'" + text + "')]//following-sibling::span";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String actual = element.getAttribute("innerText");
        String expected = DataManager.userObject.get(key).toString();
        assertEquals(expected, actual);
    }

    @And("Switch to tab with index {int}")
    public void switchToTabWithIndex(int index) {
        hp.switchToTabWithIndex(index);
    }

    @And("Scroll till the end of transactions")
    public void scrollTillTheEndOfTransactions() throws Throwable {
        rh.scrollTillTheEndOfTransactions();
    }

    @And("Scroll button {string} into bottom view")
    public void scrollButtonIntoBottomView(String text) throws Throwable {
        WebElement element = SelectByXpath.CreateElementByButtonText(text);
        JSHelpers.ScrollIntoViewBottom(element);
    }

    @And("Scroll button contains text {string} into bottom view")
    public void scrollButtonContainsTextIntoBottomView(String text) throws Throwable {
        WebElement element = SelectByXpath.CreateElementByButtonContainsText(text);
        JSHelpers.ScrollIntoViewBottom(element);
    }

    @Then("Assert element by class {string} is displayed")
    public void assertElementByClassIsDisplayed(String className) throws Throwable {
        By waitEl = By.xpath("//*[@class='" + className + "']");
        WaitHelpers.WaitForElement(waitEl);

        WebElement element = SelectByClassName.CreateElementByXpath(className);
        assertTrue(element.isDisplayed());
    }

    @Then("Assert element by contains class {string} is displayed")
    public void assertElementByContainsClassIsDisplayed(String className) throws Throwable {
        String xPath = "//*[contains(@class, '" + className + "')]";
        By waitEl = SelectByXpath.CreateByElementByXpath(xPath);
        WaitHelpers.WaitForElement(waitEl);

        WebElement element = SelectByXpath.CreateElementByXpathContainingClass(className);
        assertTrue(element.isDisplayed());
    }

    @Then("Assert element by text {string} is displayed")
    public void assertElementByTextIsDisplayed(String text) throws Throwable {
        By elWait = SelectByText.CreateByElementByText(text);
        WaitHelpers.WaitForElement(elWait);

        WebElement element = SelectByText.CreateElementByXpathText(text);
        assertTrue(element.isDisplayed());
    }

    @And("Assert element by id {string} is empty")
    public void assertElementByIdIsEmpty(String id) throws Throwable {
        By waitEl = SelectById.CreateByElementById(id);
        WaitHelpers.WaitForElement(waitEl);

        WebElement element = SelectById.CreateElementById(id);
        assertEquals("", element.getAttribute("value"));
    }

    @Then("Assert element by tag {string} containing text {string} is displayed")
    public void assertElementByTagContainingTextIsDisplayed(String tag, String text) throws Throwable {
        String xPath = "//" + tag + "[contains(text(),'" + text + "')]";
        By waitEl = SelectByXpath.CreateByElementByXpath(xPath);
        WaitHelpers.WaitForElement(waitEl);

        WebElement element = SelectByText.CreateElementByXpathTagContainingText(tag, text);
        assertTrue(element.isDisplayed());
    }

    @And("Scroll to element by contains class {string} containing text under key {string}")
    public void scrollToElementByContainsClassContainingTextUnderKey(String className, String key) throws Throwable {
        String text = DataManager.userObject.get(key).toString();
        WebElement element = SelectByXpath.CreateElementByXpathContainsClassContainingText(className, text);
        JSHelpers.ScrollIntoViewBottom(element);
    }

    @And("Scroll till you find element under key {string} from txt file and click")
    public void scrollTillYouFindElementUnderKeyFromTxtFileAndClick(String key) throws Throwable {
        String text = Utilities.getDataFromTxtFileUnderKey(key);
        //rh.scrollToBottomFindTextAndClick(text);
        rh.scrollXtimesFindTextAndClick(3, text);
        WaitHelpers.waitForSeconds(3);//Zato sto moze da se desi stale element a nemam trenutno pametnije resenje
    }

    @And("Scroll till you find text {string} and click currency")
    public void scrollTillYouFindTextAndClickCurrency(String text) {
        rh.scrollTillYouFindTextAndClick(text);
    }

    @And("Scroll element containing class {string} into bottom view")
    public void scrollElementContainingClassIntoBottomView(String className) throws Throwable {
        WebElement element = SelectByXpath.CreateElementByXpathContainingClass(className);
        JSHelpers.ScrollIntoViewBottom(element);
    }

    @And("Scroll bottom to element by contains class {string} containing text under key {string}")
    public void scrollBottomToElementByContainsClassContainingTextUnderKey(String className, String key) throws Throwable {
        String text = DataManager.userObject.get(key).toString();
        WebElement element = SelectByXpath.CreateElementByXpathContainsClassContainingText(className, text);
        JSHelpers.ScrollIntoViewBottom(element);
    }

    @And("Assert element by id {string} is displayed")
    public void assertElementByIdIsDisplayed(String id) throws Throwable {
        WebElement element = SelectById.CreateElementById(id);
        assertTrue(element.isDisplayed());
    }

    @Then("Assert element by title {string}")
    public void assertElementByTitle(String title) throws Throwable {
        String xPath = "//*[@title='" + title + "']";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
    }

    @When("Click on element by {string} contains class {string} and tag {string} with text {string}")
    public void clickOnElementByContainsClassAndDescendantTagWithText(String tag, String className, String descendant, String text) throws Throwable {
        WebElement element = SelectByXpath.CreateElementByXpathTagContainsClassWithDescendantContainsText(tag, className, descendant, text);
        hp.ClickOnElement(element);
    }

    @And("Assert value {string} in element by id {string}")
    public void assertValueInElementById(String expected, String id) throws Throwable {
        By waitEl = SelectById.CreateByElementById(id);
        WaitHelpers.WaitForElement(waitEl);

        WebElement element = SelectById.CreateElementById(id);
        assertEquals(expected, element.getAttribute("value"));
    }

    @And("Assert {string} in element by class {string} is from excel {string} columnName {string}")
    public void assertInElementByClassIsFromExcelColumnName(String attribute, String className, String rowindex, String columnName) throws Throwable {
        String expected = DataManager.getDataFromHashDatamap(rowindex, columnName);
        By waitEl = SelectByClassName.CreateByElementByClassName(className);
        WaitHelpers.WaitForElement(waitEl);

        WebElement element = SelectByClassName.CreateElementByXpath(className);
        assertEquals(expected, element.getAttribute(attribute));
    }

    @And("Assert tag {string} is displayed")
    public void assertTagIsDisplayed(String tag) throws Throwable {
        String xPath = "//" + tag;
        By waitEl = SelectByXpath.CreateByElementByXpath(xPath);
        WaitHelpers.WaitForElement(waitEl);

        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
    }

    @And("Assert element by tag {string} containing text {string} and text {string}")
    public void assertElementByTagContainingTextAndText(String tag, String textOne, String textTwo) throws Throwable {
        String xPath = "//" + tag + "[contains(text(),'" + textOne + "') and contains(text(),'" + textTwo + "')]";
        By waitEl = SelectByXpath.CreateByElementByXpath(xPath);
        WaitHelpers.WaitForElement(waitEl);

        WebElement element = SelectByXpath.CreateElementByXpathTagContainingTextAndText(tag, textOne, textTwo);
        assertTrue(element.isDisplayed());
    }

    @And("Assert list of elements containing class {string} are displayed")
    public void assertListOfElementsContainingClassAreDisplayed(String className) throws Throwable {
        List<WebElement> webElementList = SelectByClassName.CreateElementsByContainingClassName(className);
        for (WebElement element : webElementList) {
            assertTrue(element.isDisplayed());
        }
    }

    @And("Assert {string} in element by contains class {string} ends with {string}")
    public void assertInElementByContainsClassEndsWith(String attribute, String className, String text) throws Throwable {
        WebElement element = SelectByXpath.CreateElementByXpathContainingClass(className);
        String content = element.getAttribute("innerText");
        assertTrue(content.endsWith(text));
    }

    @And("Assert values under keys {string} and {string} are different")
    public void assertValuesUnderKeysAndAreDifferent(String key1, String key2) {
        String otp1 = (String) DataManager.userObject.get(key1);
        String otp2 = (String) DataManager.userObject.get(key2);

        assertNotEquals(otp1, otp2);
    }

    @And("Refresh page")
    public void refreshPage() {
        driver.navigate().refresh();
    }

    @And("Close current tab")
    public void closeCurrentTab() {
        JSHelpers.closeCurrentTab();
    }

    @And("Assert text {string} does not exist")
    public void assertTextDoesNotExist(String text) throws Throwable {
        String xPath = "//*[contains(text(),'" + text + "')]";
        By el = By.xpath(xPath);
        boolean notifExists = ActionApiHelpers.isElementDisplayedCustom(el, 3, 300);
        assertFalse(notifExists);
    }

    @And("Assert value {string} in element by contains class {string}")
    public void assertValueInElementByContainsClass(String expected, String className) throws Throwable {
        By waitEl = SelectByClassName.CreateByElementByClassName(className);
        WaitHelpers.WaitForElement(waitEl);

        WebElement element = SelectByXpath.CreateElementByXpathContainingClass(className);
        assertEquals(expected, element.getAttribute("value"));
    }

    @And("Assert property {string} has {string} in element by contains class {string}")
    public void assertPropertyHasInElementByContainsClass(String property, String expected, String className) throws Throwable {
        WebElement element = SelectByXpath.CreateElementByXpathContainingClass(className);
        assertEquals(expected, element.getAttribute(property));
    }

    @And("Assert inner text of element that contains class {string} is from excel {string} columnName {string}")
    public void assertInnerTextOfElementThatContainsClassIsFromExcelColumnName(String className, String rowindex, String columnName) throws Throwable {
        String expected = DataManager.getDataFromHashDatamap(rowindex, columnName);
        WebElement element = SelectByXpath.CreateElementByXpathContainingClass(className);
        assertEquals(expected, element.getAttribute("innerText"));
    }

    @And("Click on button with title {string}")
    public void clickOnButtonWithTitle(String title) throws Throwable {
        String xPath = "//button[@title='" + title + "']";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Wait for element by class {string}")
    public void waitForElementByClass(String className) throws Throwable {
        String xPath = "//*[contains(@class,'" + className + "')]";
        By el = By.xpath(xPath);
        WaitHelpers.WaitForElement(el);
    }

    @And("Close previous tab")
    public void closePreviousTab() {
        hp.switchToTabWithIndex(1);
        //JSHelpers.closeCurrentTab();
        JSHelpers.closeCurrentTabNewVersion();
        hp.switchToTabWithIndex(1);
    }

    @And("Scroll dynamic page down")
    public void scrollDynamicPageDown() {
        JSHelpers.ScrollXPagesOnDynamicLoadingpage(1);
    }

    @And("Assert element from excel {string} columnName {string} is not displayed")
    public void assertElementFromExcelColumnNameIsNotDisplayed(String rowindex, String columnName) throws Throwable {
        String text = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPath = "//*[contains(text(),'" + text + "')]";
        By el = By.xpath(xPath);
        boolean messageExists = ActionApiHelpers.isElementDisplayedCustom(el, 5, 1000);
        assertFalse(messageExists);
    }

    @And("Assert occurence number {string} of tag {string} has innerText from excel {string} columnName {string}")
    public void assertOccurenceNumberOfTagHasInnerTextFromExcelColumnName(String num, String tag, String rowindex, String columnName) throws Throwable {
        String xPath = "(//" + tag + ")[" + num + "]";
        By waitEl = SelectByXpath.CreateByElementByXpath(xPath);
        WaitHelpers.WaitForElement(waitEl);

        String expected = DataManager.getDataFromHashDatamap(rowindex, columnName);
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertEquals(expected, element.getAttribute("innerText"));
    }

    @And("Assert outer text {string} in elemeny by id {string}")
    public void assertOuterTextInElemenyById(String expected, String id) throws Throwable {
        WebElement element = SelectById.CreateElementById(id);
        assertEquals(expected, element.getAttribute("outerText"));
    }

    @And("Remember text {string} under key {string} in txt file")
    public void rememberTextUnderKeyInTxtFile(String text, String key) {
        Utilities.saveTheValueToFile(text, key);
    }

    @And("Click on tag {string}")
    public void clickOnTag(String tag) throws Throwable {
        String xPath = "//" + tag + "";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @Then("Assert element by id {string} is disabled")
    public void assertElementByIdIsDisabled(String id) throws Throwable {
        WebElement element = SelectById.CreateElementById(id);
        assertEquals("true", element.getAttribute("disabled"));
    }

    @And("Assert value from excel {string} columnName {string} in element by id {string}")
    public void assertValueFromExcelColumnNameInElementById(String rowindex, String columnName, String id) throws Throwable {
        WebElement element = SelectById.CreateElementById(id);
        String expected = DataManager.getDataFromHashDatamap(rowindex, columnName);
        assertEquals(expected, element.getAttribute("value"));
    }

    @Then("Assert url {string} is opened")
    public void assertUrlIsOpened(String expected) {
        hp.switchToTabWithIndex(2);
        WaitHelpers.waitForSeconds(10);
        String URL = driver.getCurrentUrl();
        assertEquals(expected, URL);
        JSHelpers.closeCurrentTab();
        hp.switchToTabWithIndex(1);
    }

    @And("Assert element by contains class {string} is disabled")
    public void assertElementByContainsClassIsDisabled(String className) throws Throwable {
        WebElement element = SelectByXpath.CreateElementByXpathContainingClass(className);
        assertEquals("true", element.getAttribute("disabled"));
    }

    @And("Click on first element by contains class {string}")
    public void clickOnFirstElementByContainsClass(String className) throws Throwable {
        String xPath = "(//*[contains(@class,'" + className + "')])[1]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Assert document with name {string} is downloaded")
    public void assertDocumentWithNameIsDownloaded(String name) {
        String path = DataManager.getDataFromHashDatamap("1", "pdf_download_path");
        assertTrue(Utilities.waitForDownloadAndCheckItByName(path, name, 100, 10));
    }

    @And("Assert text {string} can be found in pdf document in location from excel {string} {string} with file name {string}")
    public void assertTextCanBeFoundInPdfDocumentInLocationFromExcelWithFileName(String text, String rowindex, String columnName, String name) {
        String downloadPath = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String filePath = "file:///" + downloadPath + "/" + name;
        rh.verifyContentInPdfFile(text, filePath);
    }

    @And("Scroll element by contains text from excel {string} columnName {string} into bottom view")
    public void scrollElementByContainsTextFromExcelColumnNameIntoBottomView(String rowindex, String columnName) throws Throwable {
        String text = DataManager.getDataFromHashDatamap(rowindex, columnName);
        WebElement element = SelectByText.CreateElementByXpathContainingText(text);
        JSHelpers.ScrollIntoViewBottom(element);
    }

    @Then("Assert text under key {string} is displayed")
    public void assertTextUnderKeyIsDisplayed(String key) throws Throwable {
        String text = (String) DataManager.userObject.get(key);
        WebElement element = SelectByText.CreateElementByXpathContainingText(text);
        assertTrue(element.isDisplayed());
    }

    @Then("Assert list of elements with tag {string} contain {string}")
    public void assertListOfElementsWithTagContain(String tag, String expectedCurrency) throws Throwable {
        String xPath = "//" + tag;
        List<WebElement> webElementList = SelectByXpath.CreateElementsByXpath(xPath);
        List<String> actualList = new ArrayList<>();
        for (WebElement element : webElementList) {
            actualList.add(element.getAttribute("innerText"));
        }
        assertTrue(actualList.size() > 0);
        for (String s : actualList) {
            assertTrue(s.contains(expectedCurrency));
        }
    }

    @Then("Assert list of elements with tag {string} does not contain {string}")
    public void assertListOfElementsWithTagDoesNotContain(String tag, String expectedCurrency) throws Throwable {
        String xPath = "//" + tag;
        List<WebElement> webElementList = SelectByXpath.CreateElementsByXpath(xPath);
        List<String> actualList = new ArrayList<>();
        for (WebElement element : webElementList) {
            actualList.add(element.getAttribute("innerText"));
        }
        assertTrue(actualList.size() > 0);
        for (String s : actualList) {
            assertFalse(s.contains(expectedCurrency));
        }
    }

    @And("Assert element by class {string} and index {string}")
    public void assertElementByClassAndIndex(String className, String index) throws Throwable {
        String xPath = "(//*[@class='" + className + "'])[" + index + "]";
        By waitEl = SelectByXpath.CreateByElementByXpath(xPath);
        WaitHelpers.WaitForElement(waitEl);

        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
    }

    @And("Assert element by class {string} and index {string} has attribute {string} with value {string}")
    public void assertElementByClassAndIndexHasAttributeWithValue(String className, String index, String attributeName, String expectedValueOfAttribute) throws Throwable {
        String xPath = "(//*[@class='" + className + "'])[" + index + "]";
        By waitEl = SelectByXpath.CreateByElementByXpath(xPath);
        WaitHelpers.WaitForElement(waitEl);

        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String actualValueOfAttribute = element.getAttribute(attributeName);
        assertEquals(expectedValueOfAttribute, actualValueOfAttribute);
    }

    @And("Assert element by tag {string} has text {string}")
    public void assertElementByTagHasText(String tag, String text) throws Throwable {
        String xPath = "//" + tag + "[text()= '" + text + "']";
        By waitEl = SelectByXpath.CreateByElementByXpath(xPath);
        WaitHelpers.WaitForElement(waitEl);

        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
    }

    @And("Assert element by text from excel {string} columnName {string} is displayed")
    public void assertElementByTextFromExcelColumnNameIsDisplayed(String rowindex, String columnName) throws Throwable {
        String text = DataManager.getDataFromHashDatamap(rowindex, columnName);
        By waitEl = SelectByText.CreateByElementByText(text);
        WaitHelpers.WaitForElement(waitEl);

        WebElement element = SelectByText.CreateElementByXpathText(text);
        assertTrue(element.isDisplayed());
    }

    @Then("Assert list of elements with tag {string} and class {string} contains {string}")
    public void assertListOfElementsWithTagAndClassContains(String tag, String className, String value) throws Throwable {
        String xPath = "//" + tag + "[@class='" + className + "']";
        List<WebElement> webElementList = SelectByXpath.CreateElementsByXpath(xPath);
        List<String> actualList = new ArrayList<>();
        for (WebElement element : webElementList) {
            actualList.add(element.getAttribute("innerText"));
        }
        assertTrue(actualList.size() > 0);
        for (String s : actualList) {
            assertTrue(s.contains(value));
        }
    }

    @And("Click on element by containing class {string} with index {string}")
    public void clickOnElementByContainingClassWithIndex(String className, String index) throws Throwable {
        WebElement element = SelectByXpath.CreateElementByXpathContainingClassWithIndex(className, index);
        hp.ClickOnElement(element);
    }

    @And("Assert element by tag {string} containing text {string} has innerText {string}")
    public void assertElementByTagContainingTextHasInnerText(String tag, String text, String innerText) throws Throwable {
        WebElement element = SelectByTagName.CreateElementByTextInTag(tag, text);
        assertTrue(element.isDisplayed());
        assertEquals(innerText, element.getAttribute("innerText"));
    }

    @And("Assert element with tag {string} and class {string} is not clickable")
    public void assertElementWithTagAndClassIsNotClickable(String tag, String className) throws Throwable {
        String xPath = "//" + tag + "[@class='" + className + "']";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertFalse(element.isEnabled());
    }

    @And("Assert element with text {string} is not displayed")
    public void assertElementWithTextIsNotDisplayed(String text) throws Throwable {
        String xPath = "//*[contains(text(),'" + text + "')]";
        By el = By.xpath(xPath);
        boolean messageExists = ActionApiHelpers.isElementDisplayedCustom(el, 5, 1000);
        assertFalse(messageExists);
    }

    @And("Assert button {string} is not displayed")
    public void assertButtonIsNotDisplayed(String text) throws Throwable {
        String xPath = "//button[contains(text(), '" + text + "')]";
        By el = By.xpath(xPath);
        boolean messageExists = ActionApiHelpers.isElementDisplayedCustom(el, 5, 1000);
        assertFalse(messageExists);
    }

    @And("Assert element by id {string} contains value {string}")
    public void assertElementByIdContainsValue(String id, String innerText) throws Throwable {
        By waitEl = SelectById.CreateByElementById(id);
        WaitHelpers.WaitForElement(waitEl);

        WebElement element = SelectById.CreateElementById(id);
        String actualText = element.getAttribute("value");
        assertTrue(actualText.contains(innerText));

    }

    @And("Wait for element by text {string}")
    public void waitForElementByText(String text) throws Throwable {
        WebElement element = SelectByText.CreateElementByXpathText(text);
        WaitHelpers.WaitForElement(element, "Element");
    }


    @And("Assert element by contains class {string} with index {string}")
    public void assertElementByContainsClassWithIndex(String className, String index) throws Throwable {
        String xPath = "(//*[contains(@class, '" + className + "')])[" + index + "]";
        By waitEl = SelectByXpath.CreateByElementByXpath(xPath);
        WaitHelpers.WaitForElement(waitEl);

        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
    }

    @And("Click on button containing text {string}")
    public void clickOnButtonContainingText(String text) throws Throwable {
        String xPath = "//button[contains(text(), '" + text + "')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Assert element with tag {string} containing text {string} has full text {string}")
    public void assertElementWithTagContainingTextHasFullText(String tag, String containsText, String expected) throws Throwable {
        String xPath = "//" + tag + "[contains(text(),'" + containsText + "')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertEquals(expected, element.getAttribute("innerText"));
    }


    @And("Wait for element by title {string}")
    public void waitForElementByTitle(String title) throws Throwable {
        WebElement element = SelectByXpath.CreateElementByXpathTitle(title);
        WaitHelpers.WaitForElement(element, "Element");
    }

    @And("Assert element with tag {string} attribute {string} and attribute value {string} has text {string}")
    public void assertElementWithTagAttributeAndAttributeValueHasText(String tag, String attribute, String value, String text) throws Throwable {
        String xPath = "//" + tag + "[@" + attribute + "='" + value + "'and text()='" + text + "']";
        By waitEl = SelectByXpath.CreateByElementByXpath(xPath);
        WaitHelpers.WaitForElement(waitEl);

        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
    }

    @And("Enter text {string} in field by tag {string} attribute {string} and attribute value {string}")
    public void enterTextInFieldByTagAttributeAndAttributeValue(String text, String tag, String attributeName, String attributeValue) throws Throwable {
        String xPath = "//" + tag + "[@" + attributeName + "='" + attributeValue + "']";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        hp.EnterTextToElement(element, text);
    }

    @And("Enter text from Excel {string} columnName {string} in input field by id {string}")
    public void enterTextFromExcelColumnNameInInputFieldById(String rowIndex, String columnName, String elementId) throws Throwable {
        String text = DataManager.getDataFromHashDatamap(rowIndex, columnName);
        WebElement element = SelectById.CreateElementById(elementId);
        hp.EnterTextToElementWithClick(element, text);
    }

    @And("Login to the page")
    public void loginToThePage() throws Throwable {
        By elLoginToNLBKlik = SelectByText.CreateByElementByText("Login to NLB Klik");
        WaitHelpers.WaitForElement(elLoginToNLBKlik);
        WebElement loginToNLBKlik = SelectByXpath.CreateElementBy(elLoginToNLBKlik);
        hp.ClickOnElement(loginToNLBKlik);
    }

    @When("Click on tab {string} from main sidebar")
    public void clickOnTabFromMainSidebar(String text) throws Throwable {
        String xPath = "//*[contains(@class,'tw-min-w-sidebarNavigation') and not(contains(@class, 'md:tw-hidden'))]//nlb-icon//following-sibling::*[contains(text(),'" + text + "')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @Then("Assert that product card of name {string} and iban {string} from Excel {string} for personal account are shown correctly")
    public void assertThatProductCardOfNameAndIbanFromExcelForPersonalAccountAreShownCorrectly(String columnName1, String columnName2, String rowindex) throws Throwable {
        String productName = DataManager.getDataFromHashDatamap(rowindex, columnName1);
        String productIban = DataManager.getDataFromHashDatamap(rowindex, columnName2);
        String xPathForProductCard1 = "//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//*[contains(text(),'Current balance')]";
        String xPathForProductCard2 = "//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//*[contains(text(),'Available balance')]";
        String xPathForCurrentBalance = "(//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//nlb-heading-text//span[1])[1]";
        String xPathForAvailableBalance = "(//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//nlb-heading-text//span[1])[2]";
        String xPathForCurrentBalanceCurrency = "(//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//nlb-heading-text//span[2])[1]";
        String xPathForAvailableBalanceCurrency = "(//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//nlb-heading-text//span[2])[1]";

        WebElement elementForProductCard1 = SelectByXpath.CreateElementByXpath(xPathForProductCard1);
        assertTrue(elementForProductCard1.isDisplayed());
        WebElement elementForProductCard2 = SelectByXpath.CreateElementByXpath(xPathForProductCard2);
        assertTrue(elementForProductCard2.isDisplayed());
        WebElement elementForCurrentBalance = SelectByXpath.CreateElementByXpath(xPathForCurrentBalance);
        String stringCurrentBalance = elementForCurrentBalance.getAttribute("innerText");
        assertTrue(stringCurrentBalance.matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{2}"));
        WebElement elementForAvailableBalance = SelectByXpath.CreateElementByXpath(xPathForAvailableBalance);
        String stringAvailableBalance = elementForAvailableBalance.getAttribute("innerText");
        assertTrue(stringAvailableBalance.matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{2}"));
        WebElement elementForCurrentBalanceCurrency = SelectByXpath.CreateElementByXpath(xPathForCurrentBalanceCurrency);
        String stringCurrentBalanceCurrency = elementForCurrentBalanceCurrency.getAttribute("innerText");
        assertTrue(stringCurrentBalanceCurrency.contains("EUR"));
        WebElement elementForAvailableBalanceCurrency = SelectByXpath.CreateElementByXpath(xPathForAvailableBalanceCurrency);
        String stringAvailableBalanceCurrency = elementForAvailableBalanceCurrency.getAttribute("innerText");
        assertTrue(stringAvailableBalanceCurrency.contains("EUR"));
    }

    @And("Assert that whole product card of current account with name {string} and iban {string} from Excel {string} acts as a clickable button")
    public void assertThatWholeProductCardOfCurrentAccountWithNameAndIbanFromExcelActsAsAClickableButton(String columnName1, String columnName2, String rowindex) throws Throwable {
        String productName = DataManager.getDataFromHashDatamap(rowindex, columnName1);
        String productIban = DataManager.getDataFromHashDatamap(rowindex, columnName2);

        String xPathForProductName = "(//nlb-product-card//*[contains(text(),'" + productName + "')])[1]";
        String xPathForProductIban = "//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]";
        String xPathForCurrentBalance = "//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//*[contains(text(),'Current balance')]";
        String xPathForAvailableBalance = "//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//*[contains(text(),'Available balance')]";
        String xPathForCurrentBalanceAmount = "(//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//nlb-heading-text//span[1])[1]";
        String xPathForAvailableBalanceAmount = "(//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//nlb-heading-text//span[1])[2]";

        WebElement elementForProductName = SelectByXpath.CreateElementByXpath(xPathForProductName);
        hp.ClickOnElement(elementForProductName);
        By elPhotoHeader1 = SelectByClassName.CreateByElementByContainsClassName("tw-bg-nlb-omnichannel-photo-header");
        WaitHelpers.WaitForElement(elPhotoHeader1);
        WebElement elementForPhotoHeader1 = SelectByXpath.CreateElementBy(elPhotoHeader1);
        assertTrue(elementForPhotoHeader1.isDisplayed());
        driver.navigate().back();

        By elForProductIban = SelectByXpath.CreateByElementByXpath(xPathForProductIban);
        WaitHelpers.WaitForElement(elForProductIban);
        WebElement elementForProductIban = SelectByXpath.CreateElementBy(elForProductIban);
        hp.ClickOnElement(elementForProductIban);
        By elPhotoHeader2 = SelectByClassName.CreateByElementByContainsClassName("tw-bg-nlb-omnichannel-photo-header");
        WaitHelpers.WaitForElement(elPhotoHeader2);
        WebElement elementForPhotoHeader2 = SelectByXpath.CreateElementBy(elPhotoHeader2);
        assertTrue(elementForPhotoHeader2.isDisplayed());
        driver.navigate().back();

        By elForCurrentBalance = SelectByXpath.CreateByElementByXpath(xPathForCurrentBalance);
        WaitHelpers.WaitForElement(elForCurrentBalance);
        WebElement elementForCurrentBalance = SelectByXpath.CreateElementBy(elForCurrentBalance);
        hp.ClickOnElement(elementForCurrentBalance);
        By elPhotoHeader3 = SelectByClassName.CreateByElementByContainsClassName("tw-bg-nlb-omnichannel-photo-header");
        WaitHelpers.WaitForElement(elPhotoHeader3);
        WebElement elementForPhotoHeader3 = SelectByXpath.CreateElementBy(elPhotoHeader3);
        assertTrue(elementForPhotoHeader3.isDisplayed());
        driver.navigate().back();

        By elForAvailableBalance = SelectByXpath.CreateByElementByXpath(xPathForAvailableBalance);
        WaitHelpers.WaitForElement(elForAvailableBalance);
        WebElement elementForAvailableBalance = SelectByXpath.CreateElementBy(elForAvailableBalance);
        hp.ClickOnElement(elementForAvailableBalance);
        By elPhotoHeader4 = SelectByClassName.CreateByElementByContainsClassName("tw-bg-nlb-omnichannel-photo-header");
        WaitHelpers.WaitForElement(elPhotoHeader4);
        WebElement elementForPhotoHeader4 = SelectByXpath.CreateElementBy(elPhotoHeader4);
        assertTrue(elementForPhotoHeader4.isDisplayed());
        driver.navigate().back();

        By elForCurrentBalanceAmount = SelectByXpath.CreateByElementByXpath(xPathForCurrentBalanceAmount);
        WaitHelpers.WaitForElement(elForCurrentBalanceAmount);
        WebElement elementForCurrentBalanceAmount = SelectByXpath.CreateElementBy(elForCurrentBalanceAmount);
        hp.ClickOnElement(elementForCurrentBalanceAmount);
        By elPhotoHeader5 = SelectByClassName.CreateByElementByContainsClassName("tw-bg-nlb-omnichannel-photo-header");
        WaitHelpers.WaitForElement(elPhotoHeader5);
        WebElement elementForPhotoHeader5 = SelectByXpath.CreateElementBy(elPhotoHeader5);
        assertTrue(elementForPhotoHeader5.isDisplayed());
        driver.navigate().back();

        By elForAvailableBalanceAmount = SelectByXpath.CreateByElementByXpath(xPathForAvailableBalanceAmount);
        WaitHelpers.WaitForElement(elForAvailableBalanceAmount);
        WebElement elementForAvailableBalanceAmount = SelectByXpath.CreateElementBy(elForAvailableBalanceAmount);
        hp.ClickOnElement(elementForAvailableBalanceAmount);
        By elPhotoHeader6 = SelectByClassName.CreateByElementByContainsClassName("tw-bg-nlb-omnichannel-photo-header");
        WaitHelpers.WaitForElement(elPhotoHeader6);
        WebElement elementForPhotoHeader6 = SelectByXpath.CreateElementBy(elPhotoHeader6);
        assertTrue(elementForPhotoHeader6.isDisplayed());
    }

    @And("Go Back")
    public void goBack() {
        driver.navigate().back();
    }

    @And("Scroll to account from excel {string} columnName {string} in my products page")
    public void scrollToAccountFromExcelColumnNameInMyProductsPage(String rowindex, String columnName) throws InterruptedException {
        String stringForProductIban = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPathForProductCard = "(//nlb-product-card//*[contains(text(),'" + stringForProductIban + "')]//ancestor::nlb-product-card//div)[1]";
        By elForProductIban = SelectByXpath.CreateByElementByXpath(xPathForProductCard);
        WaitHelpers.WaitForElement(elForProductIban);
        WebElement elementForProductIban = SelectByXpath.CreateElementBy(elForProductIban);
        JSHelpers.ScrollIntoViewBottom(elementForProductIban);
    }

    @Then("Assert that product card of name {string} and iban {string} from Excel {string} for savings account are shown correctly")
    public void assertThatProductCardOfNameAndIbanFromExcelForSavingsAccountAreShownCorrectly(String columnName1, String columnName2, String rowindex) throws Throwable {
        String productName = DataManager.getDataFromHashDatamap(rowindex, columnName1);
        String productIban = DataManager.getDataFromHashDatamap(rowindex, columnName2);
        String xPathForProductCard1 = "//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//*[contains(text(),'Current balance')]";
        String xPathForProductCard2 = "//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//*[contains(text(),'Booked balance')]";
        String xPathForCurrentBalance = "(//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//nlb-heading-text//span[1])[1]";
        String xPathForBookedBalance = "(//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//nlb-heading-text//span[1])[2]";
        String xPathForCurrentBalanceCurrency = "(//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//nlb-heading-text//span[2])[1]";
        String xPathForBookedBalanceCurrency = "(//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//nlb-heading-text//span[2])[1]";

        WebElement elementForProductCard1 = SelectByXpath.CreateElementByXpath(xPathForProductCard1);
        assertTrue(elementForProductCard1.isDisplayed());
        WebElement elementForProductCard2 = SelectByXpath.CreateElementByXpath(xPathForProductCard2);
        assertTrue(elementForProductCard2.isDisplayed());
        WebElement elementForCurrentBalance = SelectByXpath.CreateElementByXpath(xPathForCurrentBalance);
        String stringCurrentBalance = elementForCurrentBalance.getAttribute("innerText");
        assertTrue(stringCurrentBalance.matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{2}"));
        WebElement elementForBookedBalance = SelectByXpath.CreateElementByXpath(xPathForBookedBalance);
        String stringBookedBalance = elementForBookedBalance.getAttribute("innerText");
        assertTrue(stringBookedBalance.matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{2}"));
        WebElement elementForCurrentBalanceCurrency = SelectByXpath.CreateElementByXpath(xPathForCurrentBalanceCurrency);
        String stringCurrentBalanceCurrency = elementForCurrentBalanceCurrency.getAttribute("innerText");
        assertTrue(stringCurrentBalanceCurrency.contains("EUR"));
        WebElement elementForBookedBalanceCurrency = SelectByXpath.CreateElementByXpath(xPathForBookedBalanceCurrency);
        String stringBookedBalanceCurrency = elementForBookedBalanceCurrency.getAttribute("innerText");
        assertTrue(stringBookedBalanceCurrency.contains("EUR"));
    }

    @And("Assert that whole product card of savings account with name {string} and iban {string} from Excel {string} acts as a clickable button")
    public void assertThatWholeProductCardOfSavingsAccountWithNameAndIbanFromExcelActsAsAClickableButton(String columnName1, String columnName2, String rowindex) throws Throwable {
        String productName = DataManager.getDataFromHashDatamap(rowindex, columnName1);
        String productIban = DataManager.getDataFromHashDatamap(rowindex, columnName2);

        String xPathForProductName = "(//nlb-product-card//*[contains(text(),'" + productName + "')])[1]";
        String xPathForProductIban = "//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]";
        String xPathForCurrentBalance = "//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//*[contains(text(),'Current balance')]";
        String xPathForBookedBalance = "//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//*[contains(text(),'Booked balance')]";
        String xPathForCurrentBalanceAmount = "(//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//nlb-heading-text//span[1])[1]";
        String xPathForBookedBalanceAmount = "(//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//nlb-heading-text//span[1])[2]";

        WebElement elementForProductName = SelectByXpath.CreateElementByXpath(xPathForProductName);
        hp.ClickOnElement(elementForProductName);
        By elPhotoHeader1 = SelectByClassName.CreateByElementByContainsClassName("tw-bg-nlb-omnichannel-photo-header");
        WaitHelpers.WaitForElement(elPhotoHeader1);
        WebElement elementForPhotoHeader1 = SelectByXpath.CreateElementBy(elPhotoHeader1);
        assertTrue(elementForPhotoHeader1.isDisplayed());
        driver.navigate().back();

        By elForProductIban = SelectByXpath.CreateByElementByXpath(xPathForProductIban);
        WaitHelpers.WaitForElement(elForProductIban);
        WebElement elementForProductIban = SelectByXpath.CreateElementBy(elForProductIban);
        JSHelpers.ScrollIntoViewBottom(elementForProductIban);
        hp.ClickOnElement(elementForProductIban);
        By elPhotoHeader2 = SelectByClassName.CreateByElementByContainsClassName("tw-bg-nlb-omnichannel-photo-header");
        WaitHelpers.WaitForElement(elPhotoHeader2);
        WebElement elementForPhotoHeader2 = SelectByXpath.CreateElementBy(elPhotoHeader2);
        assertTrue(elementForPhotoHeader2.isDisplayed());
        driver.navigate().back();

        By elForCurrentBalance = SelectByXpath.CreateByElementByXpath(xPathForCurrentBalance);
        WaitHelpers.WaitForElement(elForCurrentBalance);
        WebElement elementForCurrentBalance = SelectByXpath.CreateElementBy(elForCurrentBalance);
        JSHelpers.ScrollIntoViewBottom(elementForCurrentBalance);
        hp.ClickOnElement(elementForCurrentBalance);
        By elPhotoHeader3 = SelectByClassName.CreateByElementByContainsClassName("tw-bg-nlb-omnichannel-photo-header");
        WaitHelpers.WaitForElement(elPhotoHeader3);
        WebElement elementForPhotoHeader3 = SelectByXpath.CreateElementBy(elPhotoHeader3);
        assertTrue(elementForPhotoHeader3.isDisplayed());
        driver.navigate().back();

        By elForBookedBalance = SelectByXpath.CreateByElementByXpath(xPathForBookedBalance);
        WaitHelpers.WaitForElement(elForBookedBalance);
        WebElement elementForBookedBalance = SelectByXpath.CreateElementBy(elForBookedBalance);
        JSHelpers.ScrollIntoViewBottom(elementForBookedBalance);
        hp.ClickOnElement(elementForBookedBalance);
        By elPhotoHeader4 = SelectByClassName.CreateByElementByContainsClassName("tw-bg-nlb-omnichannel-photo-header");
        WaitHelpers.WaitForElement(elPhotoHeader4);
        WebElement elementForPhotoHeader4 = SelectByXpath.CreateElementBy(elPhotoHeader4);
        assertTrue(elementForPhotoHeader4.isDisplayed());
        driver.navigate().back();

        By elForCurrentBalanceAmount = SelectByXpath.CreateByElementByXpath(xPathForCurrentBalanceAmount);
        WaitHelpers.WaitForElement(elForCurrentBalanceAmount);
        WebElement elementForCurrentBalanceAmount = SelectByXpath.CreateElementBy(elForCurrentBalanceAmount);
        JSHelpers.ScrollIntoViewBottom(elementForCurrentBalanceAmount);
        hp.ClickOnElement(elementForCurrentBalanceAmount);
        By elPhotoHeader5 = SelectByClassName.CreateByElementByContainsClassName("tw-bg-nlb-omnichannel-photo-header");
        WaitHelpers.WaitForElement(elPhotoHeader5);
        WebElement elementForPhotoHeader5 = SelectByXpath.CreateElementBy(elPhotoHeader5);
        assertTrue(elementForPhotoHeader5.isDisplayed());
        driver.navigate().back();

        By elForBookedBalanceAmount = SelectByXpath.CreateByElementByXpath(xPathForBookedBalanceAmount);
        WaitHelpers.WaitForElement(elForBookedBalanceAmount);
        WebElement elementForBookedBalanceAmount = SelectByXpath.CreateElementBy(elForBookedBalanceAmount);
        JSHelpers.ScrollIntoViewBottom(elementForBookedBalanceAmount);
        hp.ClickOnElement(elementForBookedBalanceAmount);
        By elPhotoHeader6 = SelectByClassName.CreateByElementByContainsClassName("tw-bg-nlb-omnichannel-photo-header");
        WaitHelpers.WaitForElement(elPhotoHeader6);
        WebElement elementForPhotoHeader6 = SelectByXpath.CreateElementBy(elPhotoHeader6);
        assertTrue(elementForPhotoHeader6.isDisplayed());
    }

    @Then("Assert that product card of name {string} and iban {string} from Excel {string} for financial instruments are shown correctly")
    public void assertThatProductCardOfNameAndIbanFromExcelForFinancialInstrumentsAreShownCorrectly(String columnName1, String columnName2, String rowindex) throws Throwable {
        String productName = DataManager.getDataFromHashDatamap(rowindex, columnName1);
        String productIban = DataManager.getDataFromHashDatamap(rowindex, columnName2);
        String xPathForProductCard1 = "//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//*[contains(text(),'Sum balance')]";
        String xPathForProductCard2 = "//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//*[contains(text(),'Cash')]";
        String xPathForSumBalanceFI = "(//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//nlb-heading-text//span[1])[1]";
        String xPathForCash = "(//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//nlb-heading-text//span[1])[2]";
        String xPathForSumBalanceFICurrency = "(//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//nlb-heading-text//span[2])[1]";
        String xPathForCashCurrency = "(//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//nlb-heading-text//span[2])[1]";

        WebElement elementForProductCard1 = SelectByXpath.CreateElementByXpath(xPathForProductCard1);
        assertTrue(elementForProductCard1.isDisplayed());
        WebElement elementForProductCard2 = SelectByXpath.CreateElementByXpath(xPathForProductCard2);
        assertTrue(elementForProductCard2.isDisplayed());
        WebElement elementForSumBalanceFI = SelectByXpath.CreateElementByXpath(xPathForSumBalanceFI);
        String stringSumBalanceFI = elementForSumBalanceFI.getAttribute("innerText");
        assertTrue(stringSumBalanceFI.matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{2}"));
        WebElement elementForCash = SelectByXpath.CreateElementByXpath(xPathForCash);
        String stringCash = elementForCash.getAttribute("innerText");
        assertTrue(stringCash.matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{2}"));
        WebElement elementForSumBalanceFICurrency = SelectByXpath.CreateElementByXpath(xPathForSumBalanceFICurrency);
        String stringSumBalanceFICurrency = elementForSumBalanceFICurrency.getAttribute("innerText");
        assertTrue(stringSumBalanceFICurrency.contains("EUR"));
        WebElement elementForCashCurrency = SelectByXpath.CreateElementByXpath(xPathForCashCurrency);
        String stringCashCurrency = elementForCashCurrency.getAttribute("innerText");
        assertTrue(stringCashCurrency.contains("EUR"));
    }

    @And("Assert that whole product card of financial instruments with name {string} and iban {string} from Excel {string} acts as a clickable button")
    public void assertThatWholeProductCardOfFinancialInstrumentsWithNameAndIbanFromExcelActsAsAClickableButton(String columnName1, String columnName2, String rowindex) throws Throwable {
        String productName = DataManager.getDataFromHashDatamap(rowindex, columnName1);
        String productIban = DataManager.getDataFromHashDatamap(rowindex, columnName2);

        String xPathForProductName = "(//nlb-product-card//*[contains(text(),'" + productName + "')])[1]";
        String xPathForProductIban = "//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]";
        String xPathForSumBalanceFI = "//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//*[contains(text(),'Sum balance')]";
        String xPathForCash = "//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//*[contains(text(),'Cash')]";
        String xPathForSumBalanceFIAmount = "(//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//nlb-heading-text//span[1])[1]";
        String xPathForCashAmount = "(//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//nlb-heading-text//span[1])[2]";

        WebElement elementForProductName = SelectByXpath.CreateElementByXpath(xPathForProductName);
        hp.ClickOnElement(elementForProductName);
        By elPhotoHeader1 = SelectByClassName.CreateByElementByContainsClassName("tw-bg-nlb-omnichannel-photo-header");
        WaitHelpers.WaitForElement(elPhotoHeader1);
        WebElement elementForPhotoHeader1 = SelectByXpath.CreateElementBy(elPhotoHeader1);
        assertTrue(elementForPhotoHeader1.isDisplayed());
        driver.navigate().back();

        By elForProductIban = SelectByXpath.CreateByElementByXpath(xPathForProductIban);
        WaitHelpers.WaitForElement(elForProductIban);
        WebElement elementForProductIban = SelectByXpath.CreateElementBy(elForProductIban);
        JSHelpers.ScrollIntoViewBottom(elementForProductIban);
        hp.ClickOnElement(elementForProductIban);
        By elPhotoHeader2 = SelectByClassName.CreateByElementByContainsClassName("tw-bg-nlb-omnichannel-photo-header");
        WaitHelpers.WaitForElement(elPhotoHeader2);
        WebElement elementForPhotoHeader2 = SelectByXpath.CreateElementBy(elPhotoHeader2);
        assertTrue(elementForPhotoHeader2.isDisplayed());
        driver.navigate().back();

        By elForSumBalanceFI = SelectByXpath.CreateByElementByXpath(xPathForSumBalanceFI);
        WaitHelpers.WaitForElement(elForSumBalanceFI);
        WebElement elementForSumBalanceFI = SelectByXpath.CreateElementBy(elForSumBalanceFI);
        JSHelpers.ScrollIntoViewBottom(elementForSumBalanceFI);
        hp.ClickOnElement(elementForSumBalanceFI);
        By elPhotoHeader3 = SelectByClassName.CreateByElementByContainsClassName("tw-bg-nlb-omnichannel-photo-header");
        WaitHelpers.WaitForElement(elPhotoHeader3);
        WebElement elementForPhotoHeader3 = SelectByXpath.CreateElementBy(elPhotoHeader3);
        assertTrue(elementForPhotoHeader3.isDisplayed());
        driver.navigate().back();

        By elForCash = SelectByXpath.CreateByElementByXpath(xPathForCash);
        WaitHelpers.WaitForElement(elForCash);
        WebElement elementForCash = SelectByXpath.CreateElementBy(elForCash);
        JSHelpers.ScrollIntoViewBottom(elementForCash);
        hp.ClickOnElement(elementForCash);
        By elPhotoHeader4 = SelectByClassName.CreateByElementByContainsClassName("tw-bg-nlb-omnichannel-photo-header");
        WaitHelpers.WaitForElement(elPhotoHeader4);
        WebElement elementForPhotoHeader4 = SelectByXpath.CreateElementBy(elPhotoHeader4);
        assertTrue(elementForPhotoHeader4.isDisplayed());
        driver.navigate().back();

        By elForSumBalanceFIAmount = SelectByXpath.CreateByElementByXpath(xPathForSumBalanceFIAmount);
        WaitHelpers.WaitForElement(elForSumBalanceFIAmount);
        WebElement elementForSumBalanceFIAmount = SelectByXpath.CreateElementBy(elForSumBalanceFIAmount);
        JSHelpers.ScrollIntoViewBottom(elementForSumBalanceFIAmount);
        hp.ClickOnElement(elementForSumBalanceFIAmount);
        By elPhotoHeader5 = SelectByClassName.CreateByElementByContainsClassName("tw-bg-nlb-omnichannel-photo-header");
        WaitHelpers.WaitForElement(elPhotoHeader5);
        WebElement elementForPhotoHeader5 = SelectByXpath.CreateElementBy(elPhotoHeader5);
        assertTrue(elementForPhotoHeader5.isDisplayed());
        driver.navigate().back();

        By elForCashAmount = SelectByXpath.CreateByElementByXpath(xPathForCashAmount);
        WaitHelpers.WaitForElement(elForCashAmount);
        WebElement elementForCashAmount = SelectByXpath.CreateElementBy(elForCashAmount);
        JSHelpers.ScrollIntoViewBottom(elementForCashAmount);
        hp.ClickOnElement(elementForCashAmount);
        By elPhotoHeader6 = SelectByClassName.CreateByElementByContainsClassName("tw-bg-nlb-omnichannel-photo-header");
        WaitHelpers.WaitForElement(elPhotoHeader6);
        WebElement elementForPhotoHeader6 = SelectByXpath.CreateElementBy(elPhotoHeader6);
        assertTrue(elementForPhotoHeader6.isDisplayed());
    }

    @Then("Assert that product card of name {string} and iban {string} from Excel {string} for gradual savings account are shown correctly")
    public void assertThatProductCardOfNameAndIbanFromExcelForGradualSavingsAccountAreShownCorrectly(String columnName1, String columnName2, String rowindex) throws Throwable {
        String productName = DataManager.getDataFromHashDatamap(rowindex, columnName1);
        String productIban = DataManager.getDataFromHashDatamap(rowindex, columnName2);
        String xPathForProductCard1 = "//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//*[contains(text(),'Current balance')]";
        String xPathForCurrentBalance = "(//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//nlb-heading-text//span[1])[1]";
        String xPathForCurrentBalanceCurrency = "(//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//nlb-heading-text//span[2])[1]";

        WebElement elementForProductCard1 = SelectByXpath.CreateElementByXpath(xPathForProductCard1);
        assertTrue(elementForProductCard1.isDisplayed());
        WebElement elementForCurrentBalance = SelectByXpath.CreateElementByXpath(xPathForCurrentBalance);
        String stringCurrentBalance = elementForCurrentBalance.getAttribute("innerText");
        assertTrue(stringCurrentBalance.matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{2}"));
        WebElement elementForCurrentBalanceCurrency = SelectByXpath.CreateElementByXpath(xPathForCurrentBalanceCurrency);
        String stringCurrentBalanceCurrency = elementForCurrentBalanceCurrency.getAttribute("innerText");
        assertTrue(stringCurrentBalanceCurrency.contains("EUR"));
    }

    @And("Assert that whole product card of gradual savings account with name {string} and iban {string} from Excel {string} acts as a clickable button")
    public void assertThatWholeProductCardOfGradualSavingsAccountWithNameAndIbanFromExcelActsAsAClickableButton(String columnName1, String columnName2, String rowindex) throws Throwable {
        String productName = DataManager.getDataFromHashDatamap(rowindex, columnName1);
        String productIban = DataManager.getDataFromHashDatamap(rowindex, columnName2);

        String xPathForProductName = "(//nlb-product-card//*[contains(text(),'" + productName + "')])[1]";
        String xPathForProductIban = "//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]";
        String xPathForCurrentBalance = "//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//*[contains(text(),'Current balance')]";
        String xPathForCurrentBalanceAmount = "(//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//nlb-heading-text//span[1])[1]";

        WebElement elementForProductName = SelectByXpath.CreateElementByXpath(xPathForProductName);
        hp.ClickOnElement(elementForProductName);
        By elPhotoHeader1 = SelectByClassName.CreateByElementByContainsClassName("tw-bg-nlb-omnichannel-photo-header");
        WaitHelpers.WaitForElement(elPhotoHeader1);
        WebElement elementForPhotoHeader1 = SelectByXpath.CreateElementBy(elPhotoHeader1);
        assertTrue(elementForPhotoHeader1.isDisplayed());
        driver.navigate().back();

        By elForProductIban = SelectByXpath.CreateByElementByXpath(xPathForProductIban);
        WaitHelpers.WaitForElement(elForProductIban);
        WebElement elementForProductIban = SelectByXpath.CreateElementBy(elForProductIban);
        JSHelpers.ScrollIntoViewBottom(elementForProductIban);
        hp.ClickOnElement(elementForProductIban);
        By elPhotoHeader2 = SelectByClassName.CreateByElementByContainsClassName("tw-bg-nlb-omnichannel-photo-header");
        WaitHelpers.WaitForElement(elPhotoHeader2);
        WebElement elementForPhotoHeader2 = SelectByXpath.CreateElementBy(elPhotoHeader2);
        assertTrue(elementForPhotoHeader2.isDisplayed());
        driver.navigate().back();

        By elForCurrentBalance = SelectByXpath.CreateByElementByXpath(xPathForCurrentBalance);
        WaitHelpers.WaitForElement(elForCurrentBalance);
        WebElement elementForCurrentBalance = SelectByXpath.CreateElementBy(elForCurrentBalance);
        JSHelpers.ScrollIntoViewBottom(elementForCurrentBalance);
        hp.ClickOnElement(elementForCurrentBalance);
        By elPhotoHeader3 = SelectByClassName.CreateByElementByContainsClassName("tw-bg-nlb-omnichannel-photo-header");
        WaitHelpers.WaitForElement(elPhotoHeader3);
        WebElement elementForPhotoHeader3 = SelectByXpath.CreateElementBy(elPhotoHeader3);
        assertTrue(elementForPhotoHeader3.isDisplayed());
        driver.navigate().back();

        By elForCurrentBalanceAmount = SelectByXpath.CreateByElementByXpath(xPathForCurrentBalanceAmount);
        WaitHelpers.WaitForElement(elForCurrentBalanceAmount);
        WebElement elementForCurrentBalanceAmount = SelectByXpath.CreateElementBy(elForCurrentBalanceAmount);
        JSHelpers.ScrollIntoViewBottom(elementForCurrentBalanceAmount);
        hp.ClickOnElement(elementForCurrentBalanceAmount);
        By elPhotoHeader5 = SelectByClassName.CreateByElementByContainsClassName("tw-bg-nlb-omnichannel-photo-header");
        WaitHelpers.WaitForElement(elPhotoHeader5);
        WebElement elementForPhotoHeader5 = SelectByXpath.CreateElementBy(elPhotoHeader5);
        assertTrue(elementForPhotoHeader5.isDisplayed());
    }

    @Then("Change name of product from excel {string} columnName {string} into {string}")
    public void changeNameOfProductFromExcelColumnNameInto(String rowindex, String columnName, String changedName) throws Throwable {
        String stringForProductIban = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPathForEditIcon = "//*[contains(text(),'" + stringForProductIban + "')]//ancestor::nlb-products-edit-list-item//*[contains(@class,'icon-edit')]";
        WebElement elementForEditIcon = SelectByXpath.CreateElementByXpath(xPathForEditIcon);
        JSHelpers.ScrollIntoViewBottom(elementForEditIcon);
        hp.ClickOnElement(elementForEditIcon);

        By elForEditProductNameAssert = SelectByText.CreateByElementByText("Rename product");
        WaitHelpers.WaitForElement(elForEditProductNameAssert);

        String xPathForInput = "//input";
        WebElement elementForInput = SelectByXpath.CreateElementByXpath(xPathForInput);
        hp.EnterTextToElement(elementForInput, changedName);

        WebElement elementForApply = SelectByText.CreateElementByXpathContainingText("Apply");
        hp.ClickOnElement(elementForApply);
    }

    @And("Wait for element by contains text {string}")
    public void waitForElementByContainsText(String text) throws InterruptedException {
        By elForWaitElement = SelectByText.CreateByElementByContainsText(text);
        WaitHelpers.WaitForElement(elForWaitElement);
    }

    @And("Assert that products in my products have loaded")
    public void assertThatProductsInMyProductsHaveLoaded() throws Throwable {
        String xPath = "//*[contains(@class,'tw-min-w-sidebarNavigation') and not(contains(@class, 'md:tw-hidden'))]//nlb-icon//following-sibling::*[contains(text(),'My products')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        hp.ClickOnElement(element);
        String xPathForLoadedProduct = "(//nlb-product-card//*[1])[1]";
        By elForWaitElement = SelectByXpath.CreateByElementByXpath(xPathForLoadedProduct);
        WaitHelpers.WaitForElement(elForWaitElement);
    }

    @And("Hide product with iban from excel {string} columnName {string}")
    public void hideProductWithIbanFromExcelColumnName(String rowindex, String columnName) throws Throwable {
        String stringForProductIban = DataManager.getDataFromHashDatamap(rowindex, columnName);
        if (stringForProductIban.equals(".")) {
            System.out.println("Nije koriscena metoda");
        } else {
            String xPathForHideIcon = "//*[contains(text(),'" + stringForProductIban + "')]//ancestor::nlb-products-edit-list-item//*[contains(@class,'icon-eye')]";
            WebElement elementForHideButton = SelectByXpath.CreateElementByXpath(xPathForHideIcon);
            hp.ClickOnElement(elementForHideButton);
            String xPath = "//*[contains(@class,'icon-eye-off')]";
            By el = By.xpath(xPath);
            WaitHelpers.WaitForElement(el);
        }
    }

    @And("Unhide product with iban from excel {string} columnName {string}")
    public void unhideProductWithIbanFromExcelColumnName(String rowindex, String columnName) throws Throwable {
        String stringForProductIban = DataManager.getDataFromHashDatamap(rowindex, columnName);
        if (stringForProductIban.equals(".")) {
            System.out.println("Nije koriscena metoda");
        } else {
            String xPathForHideIcon = "//*[contains(text(),'" + stringForProductIban + "')]//ancestor::nlb-products-edit-list-item//*[contains(@class,'icon-eye-off')]";
            WebElement elementForHideButton = SelectByXpath.CreateElementByXpath(xPathForHideIcon);
            hp.ClickOnElement(elementForHideButton);
            String xPath = "//*[contains(@class,'icon-eye')]";
            By el = By.xpath(xPath);
            WaitHelpers.WaitForElement(el);
        }
    }

    @And("Assert element by contains text from excel {string} columnName {string} is displayed")
    public void assertElementByContainsTextFromExcelColumnNameIsDisplayed(String rowindex, String columnName) throws Throwable {
        String text = DataManager.getDataFromHashDatamap(rowindex, columnName);
        By waitEl = SelectByText.CreateByElementByContainsText(text);
        WaitHelpers.WaitForElement(waitEl);

        WebElement element = SelectByXpath.CreateElementBy(waitEl);
        assertTrue(element.isDisplayed());
    }

    @And("Change favorite account to account from Excel {string} columnName {string}")
    public void changeFavoriteAccountToAccountFromExcelColumnName(String rowindex, String columnName) throws Throwable {
        String stringForAccountIban = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPathForFavoriteAccountRadioButton = "//*[contains(text(),'" + stringForAccountIban + "')]//ancestor::div[1]//preceding-sibling::nlb-radio-button//label";
        WebElement elementForFavoriteAccountRadioButton = SelectByXpath.CreateElementByXpath(xPathForFavoriteAccountRadioButton);
        hp.ClickOnElement(elementForFavoriteAccountRadioButton);

        WebElement elementForButtonApply = SelectByText.CreateElementByXpathContainingText("Apply");
        hp.ClickOnElement(elementForButtonApply);
    }

    @And("Assert that first product shown on my products page is from Excel {string} columnName {string}")
    public void assertThatFirstProductShownOnMyProductsPageIsFromExcelColumnName(String rowindex, String columnName) throws Throwable {
        String stringForAccountIban = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPathForListOfAccountIbans = "//*[contains(@class,'callout medium')]";
        List<WebElement> elementListOfAccountIbans = SelectByXpath.CreateElementsByXpath(xPathForListOfAccountIbans);

        String stringForActualFirstIban = elementListOfAccountIbans.get(0).getAttribute("innerText");
        assertEquals(stringForAccountIban, stringForActualFirstIban);
    }

    @And("Change favorite account to default account")
    public void changeFavoriteAccountToDefaultAccount() throws Throwable {
        String xPathForFavoriteAccountRadioButton = "//*[contains(text(),'Default sorting')]//ancestor::div[1]//preceding-sibling::nlb-radio-button//label";
        WebElement elementForFavoriteAccountRadioButton = SelectByXpath.CreateElementByXpath(xPathForFavoriteAccountRadioButton);
        hp.ClickOnElement(elementForFavoriteAccountRadioButton);
    }

    @Then("Assert that products in my products page are correctly sorted using correct sort from Excel {string} columnName {string}")
    public void assertThatProductsInMyProductsPageAreCorrectlySortedUsingCorrectSortFromExcelColumnName(String rowindex, String columnName) throws Throwable {
        String stringForCorrectlySortedProducts = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPathForListOfAccountIbans = "//*[contains(@class,'callout medium')]";
        List<WebElement> elementListOfAccountIbans = SelectByXpath.CreateElementsByXpath(xPathForListOfAccountIbans);
        String stringForActualSortedProducts = "";
        for (WebElement element : elementListOfAccountIbans) {
            stringForActualSortedProducts = stringForActualSortedProducts + element.getAttribute("innerText") + ",";
        }
        assertEquals(stringForActualSortedProducts, stringForCorrectlySortedProducts);
    }

    @And("Assert button with type {string} is disabled")
    public void assertButtonWithTypeIsDisabled(String type) throws Throwable {
        String xPathForButton = "//button[@type='" + type + "']";
        WebElement elementForButton = SelectByXpath.CreateElementByXpath(xPathForButton);
        assertEquals(elementForButton.getAttribute("disabled"), "true");
    }

    @And("Scroll element by tag {string} and contains text {string} into bottom view")
    public void scrollElementByTagAndContainsTextIntoBottomView(String tag, String text) throws Throwable {
        String xPathForElementForScroll = "//" + tag + "[contains(text(),'" + text + "')]";
        WebElement elementForScroll = SelectByXpath.CreateElementByXpath(xPathForElementForScroll);
        JSHelpers.ScrollIntoViewBottom(elementForScroll);
    }

    @And("Assert that amount input field for Pay or Transfer is correct")
    public void assertThatAmountInputFieldForPayOrTransferIsCorrect() throws Throwable {
        String xPathForInputFieldForAmount = "//nlb-input-amount-currency-with-dropdown//input";
        WebElement elementForInputFieldForAmount = SelectByXpath.CreateElementByXpath(xPathForInputFieldForAmount);
        assertEquals("0,00", elementForInputFieldForAmount.getAttribute("placeholder"));
    }

    @And("Assert that all currencies are correct for currency picker in Pay or Transfer screen")
    public void assertThatAllCurrenciesAreCorrectForCurrencyPickerInPayOrTransferScreen() throws Throwable {
        String xPathForCurrencyDropdown = "//*[contains(@class,'tw-max-h-dropdownList')]";
        WebElement elementForCurrencyDropdown = SelectByXpath.CreateElementByXpath(xPathForCurrencyDropdown);
        String stringForExpectedCurrencyDropdownValues = "AUDBAMBGNCADCHFCZKDKKEURGBPHUFJPYMKDNOKPLNRSDSEKUSD";
        assertEquals(stringForExpectedCurrencyDropdownValues, elementForCurrencyDropdown.getAttribute("textContent"));
    }

    @And("Enter account iban from Excel {string} columnName {string} into creditor field in Pay or Transfer field")
    public void enterAccountIbanFromExcelColumnNameIntoCreditorFieldInPayOrTransferField(String rowindex, String columnName) throws Throwable {
        String stringForIban = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPathForInputOfIban = "//nlb-input-text//input";
        WebElement elementForInputOfIban = SelectByXpath.CreateElementByXpath(xPathForInputOfIban);
        hp.EnterTextToElement(elementForInputOfIban, stringForIban);
    }

    @And("Scroll button with type {string} into bottom view")
    public void scrollButtonWithTypeIntoBottomView(String type) throws Throwable {
        String xPathForButton = "//button[@type='" + type + "']";
        WebElement elementForButton = SelectByXpath.CreateElementByXpath(xPathForButton);
        JSHelpers.ScrollIntoViewBottom(elementForButton);
    }

    @And("Click on button with type {string}")
    public void clickOnButtonWithType(String type) throws Throwable {
        String xPathForButton = "//button[@type='" + type + "']";
        WebElement elementForButton = SelectByXpath.CreateElementByXpath(xPathForButton);
        hp.ClickOnElement(elementForButton);
    }

    @And("Enter amount {string} into amount input field in Pay or Transfer screen")
    public void enterAmountIntoAmountInputFieldInPayOrTransferScreen(String amount) throws Throwable {
        String xPathForInputFieldForAmount = "//nlb-input-amount-currency-with-dropdown//input";
        WebElement elementForInputFieldForAmount = SelectByXpath.CreateElementByXpath(xPathForInputFieldForAmount);
        hp.EnterTextToElement(elementForInputFieldForAmount, amount);
    }

    @And("Assert error message for invalid amount is {string}")
    public void assertErrorMessageForInvalidAmountIs(String error) throws Throwable {
        WebElement elementForErrorText = SelectByXpath.CreateElementByXpath("//*[contains(text(),'Enter amount between')]");
        String actualError = elementForErrorText.getAttribute("textContent").replaceAll(" ", "").replaceAll(" ", "");
        assertEquals(error.replaceAll(" ", ""), actualError);
    }

    @And("Click on amount input field in Pay or Transfer screen")
    public void clickOnAmountInputFieldInPayOrTransferScreen() throws Throwable {
        String xPathForInputFieldForAmount = "//nlb-input-amount-currency-with-dropdown//input";
        WebElement elementForInputFieldForAmount = SelectByXpath.CreateElementByXpath(xPathForInputFieldForAmount);
        hp.ClickOnElement(elementForInputFieldForAmount);
    }

    @And("Click on creditor field in Pay or Transfer screen")
    public void clickOnCreditorFieldInPayOrTransferScreen() throws Throwable {
        String xPathForInputOfIban = "//nlb-input-text//input";
        WebElement elementForInputOfIban = SelectByXpath.CreateElementByXpath(xPathForInputOfIban);
        hp.ClickOnElement(elementForInputOfIban);
    }

    @And("Enter text {string} in creditor input field in Pay or Transfer screen")
    public void enterTextInCreditorInputFieldInPayOrTransferScreen(String text) throws Throwable {
        String xPathForInputOfIban = "//nlb-input-text//input";
        WebElement elementForInputOfIban = SelectByXpath.CreateElementByXpath(xPathForInputOfIban);
        hp.EnterTextToElement(elementForInputOfIban, text);
    }

    @And("Assert placeholder for creditor input field in Pay or Transfer screen is correct")
    public void assertPlaceholderForCreditorInputFieldInPayOrTransferScreenIsCorrect() throws Throwable {
        String xPathForInputOfIban = "//nlb-input-text//input";
        WebElement elementForInputOfIban = SelectByXpath.CreateElementByXpath(xPathForInputOfIban);
        String stringForActualPlaceholder = elementForInputOfIban.getAttribute("placeholder");
        assertEquals("SI56 0000 0000 0000 000", stringForActualPlaceholder);
    }

    @And("Assert current value for creditor input field in Pay or Transfer screen is {string}")
    public void assertCurrentValueForCreditorInputFieldInPayOrTransferScreenIs(String value) throws Throwable {
        String xPathForInputOfIban = "//nlb-input-text//input";
        WebElement elementForInputOfIban = SelectByXpath.CreateElementByXpath(xPathForInputOfIban);
        String stringForActualValue = elementForInputOfIban.getAttribute("value");
        assertEquals("", stringForActualValue);
    }

    @And("Assert account iban from Excel {string} columnName {string} is in creditor input field in Pay or Transfer screen")
    public void assertAccountIbanFromExcelColumnNameIsInCreditorInputFieldInPayOrTransferScreen(String rowindex, String columnName) throws Throwable {
        String stringForIban = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPathForInputOfIban = "//nlb-input-text//input";
        WebElement elementForInputOfIban = SelectByXpath.CreateElementByXpath(xPathForInputOfIban);
        assertEquals(stringForIban, elementForInputOfIban.getAttribute("value"));
    }

    @And("Assert amount {string} in amount input field in Pay or Transfer screen")
    public void assertAmountInAmountInputFieldInPayOrTransferScreen(String expectedAmount) throws Throwable {
        String xPathForInputFieldForAmount = "//nlb-input-amount-currency-with-dropdown//input";
        WebElement elementForInputFieldForAmount = SelectByXpath.CreateElementByXpath(xPathForInputFieldForAmount);
        assertEquals(expectedAmount, elementForInputFieldForAmount.getAttribute("value"));
    }

    @And("Select User {string} for login")
    public void selectUserForLogin(String username) throws Throwable {
        String xPathList = "//label[text()='Uporabnik ']/following-sibling::div";
        WebElement listElement = SelectByXpath.CreateElementByXpath(xPathList);
        hp.ClickOnElement(listElement);
        String xPathUser = "//div[contains(@class, 'dropdown-select-item') and contains(text(), '" + username + "')]";
        WebElement userElement = SelectByXpath.CreateElementByXpath(xPathUser);
        hp.ClickOnElement(userElement);
    }

    @And("Select account from Excel {string} columnName {string} as debtor in payment screen")
    public void selectAccountFromExcelColumnNameAsDebtorInPaymentScreen(String rowindex, String columnName) throws Throwable {
        String stringForAccountIban = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPathForDebtorSelector = "(//nlb-account-selector)[1]";
        WebElement elementForDebtorSelector = SelectByXpath.CreateElementByXpath(xPathForDebtorSelector);
        hp.ClickOnElement(elementForDebtorSelector);
        WebElement elementForDebtorIban = SelectByText.CreateElementByXpathContainingText(stringForAccountIban);
        hp.ClickOnElement(elementForDebtorIban);
    }

    @And("Assert amount is {string} and currency {string} in second payment screen")
    public void assertAmountIsAndCurrencyInSecondPaymentScreen(String expectedAmount, String expectedCurrency) throws Throwable {
        String xPathForAmount = "(//nlb-input-amount-currency//input)[1]";
        String xPathForCurrency = "(//nlb-input-amount-currency//input)[2]";
        WebElement elementForAmount = SelectByXpath.CreateElementByXpath(xPathForAmount);
        WebElement elementForCurrency = SelectByXpath.CreateElementByXpath(xPathForCurrency);
        assertEquals(expectedAmount, elementForAmount.getAttribute("value"));
        assertEquals(expectedCurrency, elementForCurrency.getAttribute("value"));
    }

    @And("Assert payment purpose is {string} in second payment screen")
    public void assertPaymentPurposeIsInSecondPaymentScreen(String expectedPurpose) throws Throwable {
        String xPathForPurposeField = "(//nlb-input-text//input)[1]";
        WebElement elementForPurposeField = SelectByXpath.CreateElementByXpath(xPathForPurposeField);
        assertEquals(expectedPurpose, elementForPurposeField.getAttribute("value"));
    }

    @And("Enter random purpose into purpose field for internal payment in second payment screen and remember it under key {string}")
    public void enterRandomPurposeIntoPurposeFieldForInternalPaymentInSecondPaymentScreen(String key) throws Throwable {
        String xPathForPurposeField = "(//nlb-input-text//input)[1]";
        WebElement elementForPurposeField = SelectByXpath.CreateElementByXpath(xPathForPurposeField);
        String randomPurpose = rh.generateRandomStringOfCertainLenght(10);
        hp.deleteTextFromFieldLonger(elementForPurposeField);
        hp.EnterTextToElement(elementForPurposeField, randomPurpose);
        Utilities.saveTheValueToFile(randomPurpose, key);
    }

    @And("Assert today date in payment date field in second payment screen")
    public void assertTodayDateInPaymentDateFieldInSecondPaymentScreen() throws Throwable {
        String xPathForPaymentDateField = "//nlb-input-text[@iconname='icon-calendar-today']//input";
        WebElement elementForPaymentDateField = SelectByXpath.CreateElementByXpath(xPathForPaymentDateField);
        String expectedDate = ActionApiHelpers.getTodayDate();
        assertEquals(expectedDate, elementForPaymentDateField.getAttribute("value"));
    }

    @And("Assert Payment Amount in payment review is {string}")
    public void assertPaymentAmountInPaymentReviewIs(String expectedAmount) throws Throwable {
        String xPathForPaymentAmountAssert = "//*[contains(text(),'Payment amount')]//ancestor::nlb-heading-text//following-sibling::*//*[contains(text(),'" + expectedAmount + "')]";
        WebElement elementForPaymentAmount = SelectByXpath.CreateElementByXpath(xPathForPaymentAmountAssert);
        assertTrue(elementForPaymentAmount.isDisplayed());
    }

    @And("Assert {string} in payment review is {string}")
    public void assertInPaymentReviewIs(String text, String expectedValue) throws Throwable {
        String xPathForElementAssert = "//*[contains(text(),'" + text + "')]//following-sibling::*";
        WebElement elementForAssert = SelectByXpath.CreateElementByXpath(xPathForElementAssert);
        assertEquals(expectedValue, elementForAssert.getAttribute("textContent").trim());
    }

    @And("Assert {string} in payment review is from excel {string} columnName {string}")
    public void assertInPaymentReviewIsFromExcelColumnName(String text, String rowindex, String columnName) throws Throwable {
        String expectedValue = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPathForElementAssert = "//dt[contains(text(),'" + text + "')]//following-sibling::dd";
        WebElement elementForAssert = SelectByXpath.CreateElementByXpath(xPathForElementAssert);
        assertEquals(expectedValue, elementForAssert.getAttribute("textContent").trim());
    }

    @And("Assert second {string} in payment review is from excel {string} columnName {string}")
    public void assertSecondInPaymentReviewIsFromExcelColumnName(String text, String rowindex, String columnName) throws Throwable {
        String expectedValue = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPathForElementAssert = "(//dt[contains(text(),'" + text + "')]//following-sibling::dd)[2]";
        WebElement elementForAssert = SelectByXpath.CreateElementByXpath(xPathForElementAssert);
        assertEquals(expectedValue.trim(), elementForAssert.getAttribute("textContent").trim());
    }

    @And("Assert Purpose in payment review from txt file under key {string}")
    public void assertPurposeInPaymentReviewFromTxtFileUnderKey(String key) throws Throwable {
        String expectedPurpose = Utilities.getDataFromTxtFileUnderKey(key);
        String xPathForElementAssert = "//dt[contains(text(),'Purpose')]//following-sibling::dd";
        WebElement elementForAssert = SelectByXpath.CreateElementByXpath(xPathForElementAssert);
        assertEquals(expectedPurpose, elementForAssert.getAttribute("textContent"));
    }

    @And("Assert today date in Payment date in payment review")
    public void assertTodayDateInPaymentDateInPaymentReview() throws Throwable {
        String expectedDate = ActionApiHelpers.getTodayDate();
        String xPathForElementAssert = "//dt[contains(text(),'Payment date')]//following-sibling::dd";
        WebElement elementForAssert = SelectByXpath.CreateElementByXpath(xPathForElementAssert);
        assertEquals(expectedDate, elementForAssert.getAttribute("textContent"));
    }

    @And("Select account from Excel {string} columnName {string} in Payments tab")
    public void selectAccountFromExcelColumnNameInPaymentsTab(String rowindex, String columnName) throws Throwable {
        String stringForAccountIban = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPathForDebtorSelector = "(//nlb-account-selector)[1]";
        WebElement elementForDebtorSelector = SelectByXpath.CreateElementByXpath(xPathForDebtorSelector);
        hp.ClickOnElement(elementForDebtorSelector);
        WebElement elementForDebtorIban = SelectByText.CreateElementByXpathContainingText(stringForAccountIban);
        hp.ClickOnElement(elementForDebtorIban);
    }

    @And("Assert payments in past payments have loaded")
    public void assertPaymentsInPastPaymentsHaveLoaded() throws InterruptedException {
        String xPathForLoadedPayments = "//nlb-payment-item";
        By elForLoadedPayments = SelectByXpath.CreateByElementByXpath(xPathForLoadedPayments);
        WaitHelpers.WaitForElement(elForLoadedPayments);

    }

    @And("Assert that payment under key {string} from txt file has today date")
    public void assertThatPaymentUnderKeyFromTxtFileHasTodayDate(String key) throws Throwable {
        String expectedDate = ActionApiHelpers.getTodayDate();
        String purpose = Utilities.getDataFromTxtFileUnderKey(key);
        String xPathForPaymentDate = "//div[contains(text(),'" + purpose + "')]//ancestor::nlb-payment-item//*[contains(text(),'" + expectedDate + "')]";
        WebElement elementForPaymentDate = SelectByXpath.CreateElementByXpath(xPathForPaymentDate);
        assertTrue(elementForPaymentDate.isDisplayed());
    }

    @And("Assert that transaction amount in payment under key {string} from txt file is {string}")
    public void assertThatTransactionAmountInPaymentUnderKeyFromTxtFileIs(String key, String expectedAmount) throws Throwable {
        String purpose = Utilities.getDataFromTxtFileUnderKey(key);
        String xPathForPaymentAmount = "(//div[contains(text(),'" + purpose + "')]//ancestor::nlb-payment-item//nlb-amount)[1]//*[contains(text(),'" + expectedAmount + "')]";
        WebElement elementForPaymentAmount = SelectByXpath.CreateElementByXpath(xPathForPaymentAmount);
        assertTrue(elementForPaymentAmount.isDisplayed());
    }

    @And("Assert that transaction currency in payment under key {string} from text file is {string}")
    public void assertThatTransactionCurrencyInPaymentUnderKeyFromTextFileIs(String key, String expectedCurrency) throws Throwable {
        String purpose = Utilities.getDataFromTxtFileUnderKey(key);
        String xPathForPaymentCurrency = "(//div[contains(text(),'" + purpose + "')]//ancestor::nlb-payment-item//nlb-amount)[1]//*[contains(text(),'" + expectedCurrency + "') and not(contains(@class,'caption'))]";
        WebElement elementForPaymentCurrency = SelectByXpath.CreateElementByXpath(xPathForPaymentCurrency);
        assertTrue(elementForPaymentCurrency.isDisplayed());
    }

    @And("Assert that transaction {string} in opened past payment is from Excel {string} columnName {string}")
    public void assertThatTransactionInOpenedPastPaymentIsFromExcelColumnName(String text, String rowindex, String columnName) throws Throwable {
        String stringForExpectedValue = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPathForDataCheck = "(//*[text()='" + text + "']//following-sibling::div)[2]";
        WebElement elementForDataCheck = SelectByXpath.CreateElementByXpath(xPathForDataCheck);
        assertEquals(stringForExpectedValue.trim(), elementForDataCheck.getAttribute("textContent").trim());
    }

    @And("Assert that transaction {string} in opened past payment is {string}")
    public void assertThatTransactionInOpenedPastPaymentIs(String text, String expectedValue) throws Throwable {
        String xPathForDataCheck = "(//*[text()='" + text + "']//following-sibling::div)[2]";
        WebElement elementForDataCheck = SelectByXpath.CreateElementByXpath(xPathForDataCheck);
        assertEquals(expectedValue.trim(), elementForDataCheck.getAttribute("textContent").trim());
    }

    @And("Assert that transaction {string} in opened past payment is from txt file under key {string}")
    public void assertThatTransactionInOpenedPastPaymentIsFromTxtFileUnderKey(String text, String key) throws Throwable {
        String stringForExpectedValue = Utilities.getDataFromTxtFileUnderKey(key);
        String xPathForDataCheck = "(//*[text()='" + text + "']//following-sibling::div)[2]";
        WebElement elementForDataCheck = SelectByXpath.CreateElementByXpath(xPathForDataCheck);
        assertEquals(stringForExpectedValue.trim(), elementForDataCheck.getAttribute("textContent").trim());
    }

    @And("Remember current balance for account from Excel {string} columnName {string} under key {string}")
    public void rememberCurrentBalanceForAccountFromExcelColumnName(String rowindex, String columnName, String key) throws Throwable {
        String stringForAccountIban = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPathForCurrentBalance = "(//nlb-product-card//*[contains(text(),'" + stringForAccountIban + "')]//ancestor::nlb-product-card//nlb-heading-text//span[1])[1]";
        WebElement elementForCurrentBalance = SelectByXpath.CreateElementByXpath(xPathForCurrentBalance);
        String stringForCurrentBalance = elementForCurrentBalance.getAttribute("innerText");
        DataManager.userObject.put(key, stringForCurrentBalance);
    }

    @And("Compare if current amount balance from key {string} in my products screen for account from Excel {string} columnName {string} and reduced amount {string} is correct")
    public void compareIfCurrentAmountBalanceFromKeyInMyProductsScreenForAccountFromExcelColumnNameAndReducedAmountIsCorrect(String key, String rowindex, String columnName, String amount) throws Throwable {
        String stringForAccountIban = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPathForCurrentBalance = "(//nlb-product-card//*[contains(text(),'" + stringForAccountIban + "')]//ancestor::nlb-product-card//nlb-heading-text//span[1])[1]";
        WebElement elementForCurrentBalance = SelectByXpath.CreateElementByXpath(xPathForCurrentBalance);
        String actualAmount = elementForCurrentBalance.getAttribute("textContent").replace(".", "").replace(",", ".");
        String expectedAmountFromKey = (String) DataManager.userObject.get(key);
        Double expectedAmountDouble = Double.parseDouble(expectedAmountFromKey.replace(".", "").replace(",", "."));
        Double reduceBy = Double.parseDouble(amount);
        Double expectedAmount = expectedAmountDouble - reduceBy;
        //assertEquals(expectedAmount.toString(),actualAmount);
        Double doubleActual = Double.parseDouble(actualAmount);
        System.out.printf("%.2f%n", doubleActual);
        System.out.printf("%.2f%n", expectedAmount);
        assertEquals(expectedAmount, doubleActual);

    }

    @And("Compare if current amount balance from key {string} in my products screen for account from Exlce {string} columnName {string} and added amount {string} is correct")
    public void compareIfCurrentAmountBalanceFromKeyInMyProductsScreenForAccountFromExlceColumnNameAndAddedAmountIsCorrect(String key, String rowindex, String columnName, String amount) throws Throwable {
        String stringForAccountIban = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPathForCurrentBalance = "(//nlb-product-card//*[contains(text(),'" + stringForAccountIban + "')]//ancestor::nlb-product-card//nlb-heading-text//span[1])[1]";
        WebElement elementForCurrentBalance = SelectByXpath.CreateElementByXpath(xPathForCurrentBalance);
        String actualAmount = elementForCurrentBalance.getAttribute("textContent").replace(".", "").replace(",", ".");
        String expectedAmountFromKey = (String) DataManager.userObject.get(key);
        Double expectedAmountDouble = Double.parseDouble(expectedAmountFromKey.replace(".", "").replace(",", "."));
        Double reduceBy = Double.parseDouble(amount);
        Double expectedAmount = expectedAmountDouble + reduceBy;
        Double doubleActual = Double.parseDouble(actualAmount);
        System.out.printf("%.2f%n", doubleActual);
        System.out.printf("%.2f%n", expectedAmount);
        assertEquals(expectedAmount, doubleActual);
    }

    @And("That all products are shown in address book in pay or transfer screen using Excel {string} columnName {string}")
    public void thatAllProductsAreShownInAddressBookInPayOrTransferScreenUsingExcelColumnName(String rowindex, String columnName) throws Throwable {
        String stringForCorrectlySortedProducts = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPathForListOfAccountIbans = "//nlb-account-card//*[contains(@class,'tw-line-clamp-1')]";
        By elWait = SelectByXpath.CreateByElementByXpath(xPathForListOfAccountIbans);
        WaitHelpers.WaitForElement(elWait);
        List<WebElement> elementListOfAccountIbans = SelectByXpath.CreateElementsByXpath(xPathForListOfAccountIbans);
        String stringForActualSortedProducts = "";
        for (WebElement element : elementListOfAccountIbans) {
            stringForActualSortedProducts = stringForActualSortedProducts + element.getAttribute("innerText") + ",";
        }
        assertEquals(stringForActualSortedProducts, stringForCorrectlySortedProducts);
    }

    @And("Assert that currency selector is disabled in second payment screen")
    public void assertThatCurrencySelectorIsDisabledInSecondPaymentScreen() throws Throwable {
        String xPathForCurrency = "(//nlb-input-amount-currency//input)[2]";
        WebElement elementForCurrency = SelectByXpath.CreateElementByXpath(xPathForCurrency);
        hp.ClickOnElement(elementForCurrency);
        String xPath = "//*[contains(text(), 'USD')]";
        By el = By.xpath(xPath);
        boolean messageExists = ActionApiHelpers.isElementDisplayedCustom(el, 5, 1000);
        assertFalse(messageExists);
    }

    @And("Select account from Excel {string} columnName {string} as debtor in payment screen and check if all debtors are shown from Excel {string} columnName {string}")
    public void selectAccountFromExcelColumnNameAsDebtorInPaymentScreenAndCheckIfAllDebtorsAreShownFromExcelColumnName(String rowindex1, String columnName1, String rowindex2, String columnName2) throws Throwable {
        String stringForAccountIban = DataManager.getDataFromHashDatamap(rowindex1, columnName1);
        String stringForCorrectlySortedProducts = DataManager.getDataFromHashDatamap(rowindex2, columnName2);
        String xPathForDebtorSelector = "(//nlb-account-selector)[1]";
        WebElement elementForDebtorSelector = SelectByXpath.CreateElementByXpath(xPathForDebtorSelector);
        hp.ClickOnElement(elementForDebtorSelector);

        String xPathForListOfAccountIbans = "//nlb-account-selector//*[contains(@class,'tw-max-w-accountItemDescription')]";
        List<WebElement> elementListOfAccountIbans = SelectByXpath.CreateElementsByXpath(xPathForListOfAccountIbans);
        String stringForActualSortedProducts = "";
        for (WebElement element : elementListOfAccountIbans) {
            stringForActualSortedProducts = stringForActualSortedProducts + element.getAttribute("innerText") + ",";
        }
        assertEquals(stringForActualSortedProducts, stringForCorrectlySortedProducts);


        WebElement elementForDebtorIban = SelectByText.CreateElementByXpathContainingText(stringForAccountIban);
        hp.ClickOnElement(elementForDebtorIban);
    }

    @And("Assert amount is {string} and currency {string} in first payment screen")
    public void assertAmountIsAndCurrencyInFirstPaymentScreen(String expectedAmount, String expectedCurrency) throws Throwable {
        String xPathForAmount = "(//nlb-input-amount-currency-with-dropdown//input)[1]";
        String xPathForCurrency = "//*[@id='toggle-dropdown']";
        WebElement elementForAmount = SelectByXpath.CreateElementByXpath(xPathForAmount);
        WebElement elementForCurrency = SelectByXpath.CreateElementByXpath(xPathForCurrency);
        assertEquals(expectedAmount, elementForAmount.getAttribute("value"));
        assertEquals(expectedCurrency, elementForCurrency.getAttribute("innerText"));
    }

    @And("Select currency {string} in currency picker in Pay or Transfer screen")
    public void selectCurrencyInCurrencyPickerInPayOrTransferScreen(String currency) throws Throwable {
        String xPathForCurrency = "//*[@id='toggle-dropdown']";
        WebElement elementForCurrency = SelectByXpath.CreateElementByXpath(xPathForCurrency);
        hp.ClickOnElement(elementForCurrency);
        String xPathForSelectCurrency = "//*[text()='" + currency + "']";
        WebElement elementForSelectCurrency = SelectByXpath.CreateElementByXpath(xPathForSelectCurrency);
        hp.ClickOnElement(elementForSelectCurrency);
    }

    @And("Enter amount {string} into amount input field in second screen of internal payment")
    public void enterAmountIntoAmountInputFieldInSecondScreenOfInternalPayment(String amount) throws Throwable {
        String xPathForInputFieldForAmount = "(//nlb-input-amount-currency//input)[1]";
        WebElement elementForInputFieldForAmount = SelectByXpath.CreateElementByXpath(xPathForInputFieldForAmount);
        hp.EnterTextToElement(elementForInputFieldForAmount, amount);
    }

    @And("Enter {string} purpose into purpose field for internal payment in second payment screen")
    public void enterPurposeIntoPurposeFieldForInternalPaymentInSecondPaymentScreen(String purpose) throws Throwable {
        String xPathForPurposeField = "(//nlb-input-text//input)[1]";
        WebElement elementForPurposeField = SelectByXpath.CreateElementByXpath(xPathForPurposeField);
        hp.deleteTextFromFieldLonger(elementForPurposeField);
        hp.EnterTextToElement(elementForPurposeField, purpose);
    }

    @And("Assert that purpose can have a maximum of {string} characters")
    public void assertThatPurposeCanHaveAMaximumOfCharacters(String length) throws Throwable {
        String xPathForPurposeField = "(//nlb-input-text//input)[1]";
        WebElement elementForPurposeField = SelectByXpath.CreateElementByXpath(xPathForPurposeField);
        assertEquals(Integer.parseInt(length), elementForPurposeField.getAttribute("value").length());
    }

    @And("Enter text from Excel {string} columnName {string} in creditor input field in Pay or Transfer screen")
    public void enterTextFromExcelColumnNameInCreditorInputFieldInPayOrTransferScreen(String rowindex, String columnName) throws Throwable {
        String stringForIban = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPathForInputOfIban = "//nlb-input-text//input";
        By elWait = SelectByXpath.CreateByElementByXpath(xPathForInputOfIban);
        WaitHelpers.WaitForElement(elWait);
        WebElement elementForInputOfIban = SelectByXpath.CreateElementByXpath(xPathForInputOfIban);
        hp.EnterTextToElement(elementForInputOfIban, stringForIban);
    }

    @And("Assert element by label contains text {string} with following sibling {string} that has descendant {string} has text from Excel {string} columnName {string}")
    public void assertElementByLabelContainsTextWithFollowingSiblingThatHasDescendantHasTextFromExcelColumnName(String labelText, String siblingTag, String descendantTag, String rowindex, String columnName) throws Throwable {
        String stringForExpectedValue = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPathForAssertElement = "//label[contains(text(),'" + labelText + "')]//following-sibling::" + siblingTag + "//" + descendantTag + "";
        WebElement elementForAssert = SelectByXpath.CreateElementByXpath(xPathForAssertElement);
        assertEquals(stringForExpectedValue, elementForAssert.getAttribute("value"));
    }

    @And("Assert element by label contains text {string} with following sibling {string} that has descendant {string} has text {string}")
    public void assertElementByLabelContainsTextWithFollowingSiblingThatHasDescendantHasText(String labelText, String siblingTag, String descendantTag, String expectedText) throws Throwable {
        String xPathForAssertElement = "//label[contains(text(),'" + labelText + "')]//following-sibling::" + siblingTag + "//" + descendantTag + "";
        WebElement elementForAssert = SelectByXpath.CreateElementByXpath(xPathForAssertElement);
        assertEquals(expectedText, elementForAssert.getAttribute("value"));
    }

    @And("Assert element by label with text {string} with following sibling {string} that has descendant {string} has text {string}")
    public void assertElementByLabelWithTextWithFollowingSiblingThatHasDescendantHasText(String labelText, String siblingTag, String descendantTag, String expectedText) throws Throwable {
        String xPathForAssertElement = "//label[text()='" + labelText + "']//following-sibling::" + siblingTag + "//" + descendantTag + "";
        WebElement elementForAssert = SelectByXpath.CreateElementByXpath(xPathForAssertElement);
        assertEquals(expectedText, elementForAssert.getAttribute("value"));
    }

    @And("Enter random purpose into label with text {string} with following sibling {string} that has descendant {string} and remember it under key {string}")
    public void enterRandomPurposeIntoLabelWithTextWithFollowingSiblingThatHasDescendantAndRememberItUnderKey(String labelText, String siblingTag, String descendantTag, String key) throws Throwable {
        String xPathForPurposeField = "//label[text()='" + labelText + "']//following-sibling::" + siblingTag + "//" + descendantTag + "";
        WebElement elementForPurposeField = SelectByXpath.CreateElementByXpath(xPathForPurposeField);
        String randomPurpose = rh.generateRandomStringOfCertainLenght(10);
        hp.deleteTextFromFieldLonger(elementForPurposeField);
        hp.EnterTextToElement(elementForPurposeField, randomPurpose);
        Utilities.saveTheValueToFile(randomPurpose, key);
    }

    @And("Enter text {string} into label contains text {string} with following sibling {string} that has descendant {string}")
    public void enterTextIntoLabelContainsTextWithFollowingSiblingThatHasDescendant(String textToEnter, String labelText, String siblingTag, String descendantTag) throws Throwable {
        String xPathForEntryField = "//label[contains(text(),'" + labelText + "')]//following-sibling::" + siblingTag + "//" + descendantTag + "";
        WebElement elementForEntryField = SelectByXpath.CreateElementByXpath(xPathForEntryField);
        hp.EnterTextToElement(elementForEntryField, textToEnter);
    }

    @And("Assert first Purpose in payment review from txt file under key {string}")
    public void assertFirstPurposeInPaymentReviewFromTxtFileUnderKey(String key) throws Throwable {
        String expectedPurpose = Utilities.getDataFromTxtFileUnderKey(key);
        String xPathForElementAssert = "(//*[contains(text(),'Purpose')]//following-sibling::*)[1]";
        WebElement elementForAssert = SelectByXpath.CreateElementByXpath(xPathForElementAssert);
        assertEquals(expectedPurpose, elementForAssert.getAttribute("textContent"));
    }

    @And("Assert element by span with text {string} and following sibling tag {string} has text {string}")
    public void assertElementBySpanWithTextAndFollowingSiblingTagHasText(String spanText, String followingSiblingTag, String expectedText) throws Throwable {
        String xPath = "//*[(text()='" + spanText + "')]//following-sibling::" + followingSiblingTag + "";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertEquals(expectedText, element.getAttribute("textContent"));
    }

    @And("Assert there are {string} characters in element label contains text {string} with following sibling {string} that has descendant {string}")
    public void assertThereAreCharactersInElementLabelContainsTextWithFollowingSiblingThatHasDescendant(String characterNumber, String labelText, String siblingTag, String descendantTag) throws Throwable {
        String xPathForEntryField = "//label[contains(text(),'" + labelText + "')]//following-sibling::" + siblingTag + "//" + descendantTag + "";
        WebElement elementForEntryField = SelectByXpath.CreateElementByXpath(xPathForEntryField);
        assertEquals(Integer.parseInt(characterNumber), elementForEntryField.getAttribute("value").length());
    }

    @And("Enter text {string} into label with text {string} with following sibling {string} that has descendant {string}")
    public void enterTextIntoLabelWithTextWithFollowingSiblingThatHasDescendant(String textToEnter, String labelText, String siblingTag, String descendantTag) throws Throwable {
        String xPathForAssertElement = "//label[text()='" + labelText + "']//following-sibling::" + siblingTag + "//" + descendantTag + "";
        WebElement elementForAssert = SelectByXpath.CreateElementByXpath(xPathForAssertElement);
        hp.deleteTextFromFieldLonger(elementForAssert);
        hp.EnterTextToElement(elementForAssert, textToEnter);
    }

    @And("Assert there are {string} characters in element label with text {string} with following sibling {string} that has descendant {string}")
    public void assertThereAreCharactersInElementLabelWithTextWithFollowingSiblingThatHasDescendant(String characterNumber, String labelText, String siblingTag, String descendantTag) throws Throwable {
        String xPathForEntryField = "//label[text()='" + labelText + "']//following-sibling::" + siblingTag + "//" + descendantTag + "";
        WebElement elementForEntryField = SelectByXpath.CreateElementByXpath(xPathForEntryField);
        assertEquals(Integer.parseInt(characterNumber), elementForEntryField.getAttribute("value").length());
    }

    @And("Click on element by label contains text {string} with following sibling {string} that has descendant {string}")
    public void clickOnElementByLabelContainsTextWithFollowingSiblingThatHasDescendant(String labelText, String siblingTag, String descendantTag) throws Throwable {
        String xPathForEntryField = "//label[contains(text(),'" + labelText + "')]//following-sibling::" + siblingTag + "//" + descendantTag + "";
        WebElement elementForAssert = SelectByXpath.CreateElementByXpath(xPathForEntryField);
        hp.ClickOnElement(elementForAssert);
    }

    @And("Click on element by contains class {string} with descendant tag {string} contains text {string}")
    public void clickOnElementByContainsClassWithDescendantTagContainsText(String className, String tag, String text) throws Throwable {
        String xPath = "//*[contains(@class,'" + className + "')]//descendant::" + tag + "[contains(text(),'" + text + "')]";
        By waitEl = SelectByXpath.CreateByElementByXpath(xPath);
        WaitHelpers.WaitForElement(waitEl);

        WebElement element = SelectByClassName.CreateElementByXpathContainsClassWithDescendantTagContainingText(className, tag, text);
        hp.ClickOnElement(element);
    }

    @And("Assert element by tag {string} containing text {string} is not displayed")
    public void assertElementByTagContainingTextIsNotDisplayed(String tag, String text) throws Throwable {
        String xPath = "//" + tag + "[contains(text(),'" + text + "')]";
        By el = By.xpath(xPath);
        boolean messageExists = ActionApiHelpers.isElementDisplayedCustom(el, 5, 1000);
        assertFalse(messageExists);
    }

    @And("Assert element by label with text {string} with following sibling {string} that has descendant {string} has text under key {string}")
    public void assertElementByLabelWithTextWithFollowingSiblingThatHasDescendantHasTextUnderKey(String labelText, String siblingTag, String descendantTag, String key) throws Throwable {
        String expectedText = Utilities.getDataFromTxtFileUnderKey(key);
        String xPathForAssertElement = "//label[text()='" + labelText + "']//following-sibling::" + siblingTag + "//" + descendantTag + "";
        WebElement elementForAssert = SelectByXpath.CreateElementByXpath(xPathForAssertElement);
        assertEquals(expectedText, elementForAssert.getAttribute("value"));
    }

    @And("Assert element by contains text with special characters {string}")
    public void assertElementByContainsTextWithSpecialCharacters(String text) throws Throwable {
        String xPath = "//*[contains(text(),\"" + text + "\")]";
        By waitEl = SelectByXpath.CreateByElementByXpath(xPath);
        WaitHelpers.WaitForElement(waitEl);

        WebElement element = SelectByXpath.CreateElementBy(waitEl);
        assertTrue(element.isDisplayed());
    }

    @And("Assert element by contains second text {string}")
    public void assertElementByContainsSecondText(String text) throws InterruptedException {
        String xPath = "//*[contains(text()[2],'" + text + "')]";
        By waitEl = SelectByXpath.CreateByElementByXpath(xPath);
        WaitHelpers.WaitForElement(waitEl);

        WebElement element = SelectByXpath.CreateElementBy(waitEl);
        assertTrue(element.isDisplayed());
    }

    @And("Click on element by tag {string} contains class {string}")
    public void clickOnElementByTagContainsClass(String tag, String className) throws Throwable {
        WebElement element = SelectByXpath.CreateElementByXPathTagContainsClass(tag, className);
        hp.ClickOnElement(element);
    }

    @And("Assert element by tag {string} contains text {string} and descendant tag {string} contains text {string}")
    public void assertElementByTagContainsTextAndDescendantTagContainsText(String tag, String text, String descendantTag, String descendantText) throws Throwable {
        WebElement element = SelectByXpath.CreateElementByXpathTagContainsTextAndDescendantTagContainsText(tag, text, descendantTag, descendantText);
        assertTrue(element.isDisplayed());
    }

    @And("Assert element by label contains text {string} with following sibling {string} that has descendant {string}")
    public void assertElementByLabelContainsTextWithFollowingSiblingThatHasDescendant(String labelText, String siblingTag, String descendantTag) throws Throwable {
        String xPath = "//label[contains(text(),'" + labelText + "')]//following-sibling::" + siblingTag + "//" + descendantTag + "";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
    }

    @And("Assert element by tag {string} with following sibling {string} contains text {string}")
    public void assertElementByTagWithFollowingSiblingContainsText(String tag, String descendantTag, String descendantText) throws Throwable {
        String xPath = "//" + tag + "//" + descendantTag + "[contains(text(),'" + descendantText + "')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
    }

    @And("Assert element by tag {string} with name {string} with following sibling {string} contains text {string}")
    public void assertElementByTagWithNameWithFollowingSiblingContainsText(String tag, String name, String siblingTag, String siblingText) throws Throwable {
        String xPath = "//" + tag + "[@name='" + name + "']//following-sibling::" + siblingTag + "[contains(text(),'" + siblingText + "')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
    }

    @And("Assert element by tag {string} contains class {string} with descendant tag {string} contains text {string}")
    public void assertElementByTagContainsClassWithDescendantTagContainsText(String tag, String className, String descendantTag, String descendantText) throws Throwable {
        String xPath = "//" + tag + "[contains(@class,'" + className + "')]//" + descendantTag + "[contains(text(),'" + descendantText + "')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
    }

    @And("Enter text {string} into label with text {string} with following sibling {string}")
    public void enterTextIntoLabelWithTextWithFollowingSibling(String textToEnter, String labelText, String siblingTag) throws Throwable {
        String xPath = "//label[contains(text(),'" + labelText + "')]//following-sibling::" + siblingTag + "";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        hp.EnterTextToElement(element, textToEnter);
    }

    @And("Assert that tag for filter is {string} and has close icon")
    public void assertThatTagForFilterIsAndHasCloseIcon(String expectedTagValue) throws Throwable {
        String xPathRange = "//nlb-tag/div/div[1]";
        WebElement rangeElement = SelectByXpath.CreateElementByXpath(xPathRange);
        assertEquals(expectedTagValue, rangeElement.getAttribute("innerText"));
        String xPathIcon = "//nlb-tag/div/div[2]/nlb-icon[@name='icon-close']";
        WebElement iconElement = SelectByXpath.CreateElementByXpath(xPathIcon);
        assertTrue(iconElement.isDisplayed());
        assertTrue(iconElement.isEnabled());
    }

    @And("Assert transaction amounts after filter are between {double} and {double} in past payments")
    public void assertTransactionAmountsAfterFilterAreBetweenAndInPastPayments(double lowerBound, double upperBound) throws Throwable {
        String xPath = "//h5/nlb-amount/div/div[2]";
        List<WebElement> elements = SelectByXpath.CreateElementsByXpath(xPath);

        boolean allInRange = true;

        for (WebElement element : elements) {
            try {
                String text = element.getAttribute("innerText").replace(",", ".").replace("−", "");
                double value = Double.parseDouble(text);

                // Check if the value is within the range
                if (value < lowerBound || value > upperBound) {
                    allInRange = false;
                    break;
                }
            } catch (NumberFormatException e) {
                // Handle the exception if conversion fails
                allInRange = false;
                break;
            }
        }
        assertTrue(allInRange);

    }

    @And("Click on element by tag {string} with name {string}")
    public void clickOnElementByTagWithName(String tag, String name) throws Throwable {
        WebElement element = SelectByXpath.CreateElementByXpathTagWithName(tag, name);
        hp.ClickOnElement(element);
    }


    @And("Assert that transaction amounts after filter disabling are not only between {double} and {double} in past payments")
    public void assertThatTransactionAmountsAfterFilterDisablingAreNotOnlyBetweenAndInPastPayments(double lowerBound, double upperBound) throws Throwable {
        String xPath = "//h5/nlb-amount/div/div[2]";
        List<WebElement> elements = SelectByXpath.CreateElementsByXpath(xPath);

        boolean allInRange = true;

        for (WebElement element : elements) {
            try {
                String text = element.getAttribute("innerText").replace(",", ".").replace("−", "");
                double value = Double.parseDouble(text);

                // Check if the value is within the range
                if (value < lowerBound || value > upperBound) {
                    allInRange = false;
                    break;
                }
            } catch (NumberFormatException e) {
                // Handle the exception if conversion fails
                allInRange = false;
                break;
            }
        }
        assertFalse(allInRange);
    }

    @And("Assert element by contains text {string} with ancestor button type {string} is disabled")
    public void assertElementByContainsTextWithAncestorButtonTypeIsDisabled(String text, String type) throws Throwable {
        String xPath = "//div[contains(text(),'" + text + "')]//ancestor::button[@type='" + type + "']";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertEquals("true", element.getAttribute("disabled"));
    }

    @And("Scroll to first transaction in Products details")
    public void scrollToFirstTransactionInProductsDetails() throws Throwable {
        String xPath = "(//nlb-transaction-card)[1]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        JSHelpers.ScrollIntoViewBottom(element);
    }

    @And("Scroll to first transaction in Products details and click")
    public void scrollToFirstTransactionInProductsDetailsAndClick() throws Throwable {
        String xPath = "(//nlb-transaction-card//*[contains(@class,'category-icon-xl')])[1]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        JSHelpers.ScrollIntoViewBottom(element);
        hp.ClickOnElement(element);
    }

    @And("CLick on element by tag {string} and descendant tag {string}")
    public void clickOnElementByTagAndDescendantTag(String tag, String descendantTag) throws Throwable {
        WebElement element = SelectByTagName.CreateElementByTagAndDescendantTag(tag, descendantTag);
        hp.ClickOnElement(element);
    }

    @And("Remember whole class of element contains class {string} under key {string}")
    public void rememberWholeClassOfElementContainsClassUnderKey(String className, String key) throws Throwable {
        String xPath = "//i[contains(@class,'" + className + "')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        DataManager.userObject.put(key, element.getAttribute("className"));
    }

    @And("Assert element by contains class from key {string}")
    public void assertElementByContainsClassFromKey(String key) throws Throwable {
        String className = (String) DataManager.userObject.get(key);
        String xPath = "//*[contains(@class,'" + className + "')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
    }

    @And("Split first category into {string} with amount {string}")
    public void splitFirstCategoryIntoWithAmount(String category, String amount) throws Throwable {
        String xPath1 = "(//nlb-dropdown-select)[2]//input";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath1);
        hp.ClickOnElement(element);
        String xPath2 = "(//*[contains(@class,'dropdown-select-item')]//span[contains(text(),'" + category + "')])[2]";
        WebElement element2 = SelectByXpath.CreateElementByXpath(xPath2);
        hp.ClickOnElement(element2);
        String xPath3 = "(//nlb-input-amount-currency//input[1])[1]";
        WebElement element3 = SelectByXpath.CreateElementByXpath(xPath3);
        hp.EnterTextToElement(element3, amount);
    }

    @And("Split second category into {string} with remaining amount")
    public void splitSecondCategoryIntoWithRemainingAmount(String category) throws Throwable {
        String xPath1 = "(//nlb-dropdown-select)[3]//input";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath1);
        hp.ClickOnElement(element);
        String xPath2 = "(//*[contains(@class,'dropdown-select-item')]//span[contains(text(),'" + category + "')])[3]";
        WebElement element2 = SelectByXpath.CreateElementByXpath(xPath2);
        hp.ClickOnElement(element2);
        String xPath3 = "//nlb-select-category//nlb-amount//span[1]";
        WebElement element3 = SelectByXpath.CreateElementByXpath(xPath3);
        String amount = element3.getAttribute("innerText");
        String amountWithNoDot = amount.replaceAll("\\.", "");
        String xPath4 = "(//nlb-input-amount-currency//input[1])[2]";
        WebElement element4 = SelectByXpath.CreateElementByXpath(xPath4);
        hp.EnterTextToElement(element4, amountWithNoDot);
    }

    @And("Split first category into {string} with remaining amount")
    public void splitFirstCategoryIntoWithRemainingAmount(String category) throws Throwable {
        String xPath1 = "(//nlb-dropdown-select)[2]//input";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath1);
        hp.ClickOnElement(element);
        String xPath2 = "(//*[contains(@class,'dropdown-select-item')]//span[contains(text(),'" + category + "')])[2]";
        WebElement element2 = SelectByXpath.CreateElementByXpath(xPath2);
        hp.ClickOnElement(element2);
        String xPath3 = "//nlb-select-category//nlb-amount//span[1]";
        WebElement element3 = SelectByXpath.CreateElementByXpath(xPath3);
        String amount = element3.getAttribute("innerText");
        String amountWithNoDot = amount.replaceAll("\\.", "");
        String xPath4 = "(//nlb-input-amount-currency//input[1])[1]";
        WebElement element4 = SelectByXpath.CreateElementByXpath(xPath4);
        hp.EnterTextToElement(element4, amountWithNoDot);
    }

    @And("Split second category into {string} with amount {string}")
    public void splitSecondCategoryIntoWithAmount(String category, String amount) throws Throwable {
        String xPath1 = "(//nlb-dropdown-select)[3]//input";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath1);
        hp.ClickOnElement(element);
        String xPath2 = "(//*[contains(@class,'dropdown-select-item')]//span[contains(text(),'" + category + "')])[3]";
        WebElement element2 = SelectByXpath.CreateElementByXpath(xPath2);
        hp.ClickOnElement(element2);
        String xPath4 = "(//nlb-input-amount-currency//input[1])[2]";
        WebElement element4 = SelectByXpath.CreateElementByXpath(xPath4);
        hp.EnterTextToElement(element4, amount);
    }

    @And("Split third category into {string} with amount {string}")
    public void splitThirdCategoryIntoWithAmount(String category, String amount) throws Throwable {
        String xPath1 = "(//nlb-dropdown-select)[4]//input";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath1);
        hp.ClickOnElement(element);
        String xPath2 = "(//*[contains(@class,'dropdown-select-item')]//span[contains(text(),'" + category + "')])[4]";
        WebElement element2 = SelectByXpath.CreateElementByXpath(xPath2);
        hp.ClickOnElement(element2);
        String xPath4 = "(//nlb-input-amount-currency//input[1])[3]";
        WebElement element4 = SelectByXpath.CreateElementByXpath(xPath4);
        hp.EnterTextToElement(element4, amount);
    }

    @And("Split fourth category into {string} with amount {string}")
    public void splitFourthCategoryIntoWithAmount(String category, String amount) throws Throwable {
        String xPath1 = "(//nlb-dropdown-select)[5]//input";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath1);
        hp.ClickOnElement(element);
        String xPath2 = "(//*[contains(@class,'dropdown-select-item')]//span[contains(text(),'" + category + "')])[5]";
        WebElement element2 = SelectByXpath.CreateElementByXpath(xPath2);
        hp.ClickOnElement(element2);
        String xPath4 = "(//nlb-input-amount-currency//input[1])[4]";
        WebElement element4 = SelectByXpath.CreateElementByXpath(xPath4);
        hp.EnterTextToElement(element4, amount);
    }

    @And("Split fifth category into {string} with amount {string}")
    public void splitFifthCategoryIntoWithAmount(String category, String amount) throws Throwable {
        String xPath1 = "(//nlb-dropdown-select)[6]//input";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath1);
        hp.ClickOnElement(element);
        String xPath2 = "(//*[contains(@class,'dropdown-select-item')]//span[contains(text(),'" + category + "')])[6]";
        WebElement element2 = SelectByXpath.CreateElementByXpath(xPath2);
        hp.ClickOnElement(element2);
        String xPath4 = "(//nlb-input-amount-currency//input[1])[5]";
        WebElement element4 = SelectByXpath.CreateElementByXpath(xPath4);
        hp.EnterTextToElement(element4, amount);
    }

    @And("Split sixth category into {string} with remaining amount")
    public void splitSixthCategoryIntoWithRemainingAmount(String category) throws Throwable {
        String xPath1 = "(//nlb-dropdown-select)[7]//input";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath1);
        hp.ClickOnElement(element);
        String xPath2 = "(//*[contains(@class,'dropdown-select-item')]//span[contains(text(),'" + category + "')])[7]";
        WebElement element2 = SelectByXpath.CreateElementByXpath(xPath2);
        hp.ClickOnElement(element2);
        String xPath3 = "//nlb-select-category//nlb-amount//span[1]";
        WebElement element3 = SelectByXpath.CreateElementByXpath(xPath3);
        String amount = element3.getAttribute("innerText");
        String amountWithNoDot = amount.replaceAll("\\.", "");
        String xPath4 = "(//nlb-input-amount-currency//input[1])[6]";
        WebElement element4 = SelectByXpath.CreateElementByXpath(xPath4);
        hp.EnterTextToElement(element4, amountWithNoDot);
    }

    @And("Assert element by tag {string} contains text {string} has class {string}")
    public void assertElementByTagContainsTextHasClass(String tag, String text, String className) throws Throwable {
        WebElement element = SelectByTagName.CreateElementByTagContainsText(tag, text);
        String actualClass = element.getAttribute("className");
        assertTrue(actualClass.contains(className));
    }

    @And("Assert element by contains text {string} is not displayed")
    public void assertElementByContainsTextIsNotDisplayed(String text) throws Throwable {
        String xPath = "//*[contains(text(),'" + text + "')]";
        By el = By.xpath(xPath);
        boolean messageExists = ActionApiHelpers.isElementDisplayedCustom(el, 5, 1000);
        assertFalse(messageExists);
    }

    @And("Click on {string} button with aria label {string}")
    public void clickOnButtonWithAriaLabel(String occurence, String ariaLabel) throws Throwable {
        if (occurence.equals("first")) {
            String xPath = "(//button[@aria-label='" + ariaLabel + "'])[1]";
            WebElement element = SelectByXpath.CreateElementByXpath(xPath);
            hp.ClickOnElement(element);
        }
        if (occurence.equals("second")) {
            String xPath = "(//button[@aria-label='" + ariaLabel + "'])[2]";
            WebElement element = SelectByXpath.CreateElementByXpath(xPath);
            hp.ClickOnElement(element);
        }
        if (occurence.equals("third")) {
            String xPath = "(//button[@aria-label='" + ariaLabel + "'])[3]";
            WebElement element = SelectByXpath.CreateElementByXpath(xPath);
            hp.ClickOnElement(element);
        }
    }

    @And("Assert that product card of name {string} and iban {string} from Excel {string} for loan account are shown correctly")
    public void assertThatProductCardOfNameAndIbanFromExcelForLoanAccountAreShownCorrectly(String columnName1, String columnName2, String rowindex) throws Throwable {
        String productName = DataManager.getDataFromHashDatamap(rowindex, columnName1);
        String productIban = DataManager.getDataFromHashDatamap(rowindex, columnName2);
        String xPathForProductCard1 = "//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//*[contains(text(),'Remaining debt')]";
        String xPathForCurrentBalance = "(//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//nlb-heading-text//span[1])[1]";
        String xPathForCurrentBalanceCurrency = "(//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//nlb-heading-text//span[2])[1]";

        WebElement elementForProductCard1 = SelectByXpath.CreateElementByXpath(xPathForProductCard1);
        assertTrue(elementForProductCard1.isDisplayed());
        WebElement elementForCurrentBalance = SelectByXpath.CreateElementByXpath(xPathForCurrentBalance);
        String stringCurrentBalance = elementForCurrentBalance.getAttribute("innerText");
        assertTrue(stringCurrentBalance.matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{2}"));
        WebElement elementForCurrentBalanceCurrency = SelectByXpath.CreateElementByXpath(xPathForCurrentBalanceCurrency);
        String stringCurrentBalanceCurrency = elementForCurrentBalanceCurrency.getAttribute("innerText");
        assertTrue(stringCurrentBalanceCurrency.contains("EUR"));
    }

    @And("Assert that whole product card of loan account with name {string} and iban {string} from Excel {string} acts as a clickable button")
    public void assertThatWholeProductCardOfLoanAccountWithNameAndIbanFromExcelActsAsAClickableButton(String columnName1, String columnName2, String rowindex) throws Throwable {
        String productName = DataManager.getDataFromHashDatamap(rowindex, columnName1);
        String productIban = DataManager.getDataFromHashDatamap(rowindex, columnName2);

        String xPathForProductName = "(//nlb-product-card//*[contains(text(),'" + productName + "')])[1]";
        String xPathForProductIban = "//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]";
        String xPathForCurrentBalance = "//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//*[contains(text(),'Remaining debt')]";
        String xPathForCurrentBalanceAmount = "(//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//nlb-heading-text//span[1])[1]";

        WebElement elementForProductName = SelectByXpath.CreateElementByXpath(xPathForProductName);
        hp.ClickOnElement(elementForProductName);
        By elPhotoHeader1 = SelectByClassName.CreateByElementByContainsClassName("tw-bg-nlb-omnichannel-photo-header");
        WaitHelpers.WaitForElement(elPhotoHeader1);
        WebElement elementForPhotoHeader1 = SelectByXpath.CreateElementBy(elPhotoHeader1);
        assertTrue(elementForPhotoHeader1.isDisplayed());
        driver.navigate().back();

        By elForProductIban = SelectByXpath.CreateByElementByXpath(xPathForProductIban);
        WaitHelpers.WaitForElement(elForProductIban);
        WebElement elementForProductIban = SelectByXpath.CreateElementBy(elForProductIban);
        JSHelpers.ScrollIntoViewBottom(elementForProductIban);
        hp.ClickOnElement(elementForProductIban);
        By elPhotoHeader2 = SelectByClassName.CreateByElementByContainsClassName("tw-bg-nlb-omnichannel-photo-header");
        WaitHelpers.WaitForElement(elPhotoHeader2);
        WebElement elementForPhotoHeader2 = SelectByXpath.CreateElementBy(elPhotoHeader2);
        assertTrue(elementForPhotoHeader2.isDisplayed());
        driver.navigate().back();

        By elForCurrentBalance = SelectByXpath.CreateByElementByXpath(xPathForCurrentBalance);
        WaitHelpers.WaitForElement(elForCurrentBalance);
        WebElement elementForCurrentBalance = SelectByXpath.CreateElementBy(elForCurrentBalance);
        JSHelpers.ScrollIntoViewBottom(elementForCurrentBalance);
        hp.ClickOnElement(elementForCurrentBalance);
        By elPhotoHeader3 = SelectByClassName.CreateByElementByContainsClassName("tw-bg-nlb-omnichannel-photo-header");
        WaitHelpers.WaitForElement(elPhotoHeader3);
        WebElement elementForPhotoHeader3 = SelectByXpath.CreateElementBy(elPhotoHeader3);
        assertTrue(elementForPhotoHeader3.isDisplayed());
        driver.navigate().back();

        By elForCurrentBalanceAmount = SelectByXpath.CreateByElementByXpath(xPathForCurrentBalanceAmount);
        WaitHelpers.WaitForElement(elForCurrentBalanceAmount);
        WebElement elementForCurrentBalanceAmount = SelectByXpath.CreateElementBy(elForCurrentBalanceAmount);
        JSHelpers.ScrollIntoViewBottom(elementForCurrentBalanceAmount);
        hp.ClickOnElement(elementForCurrentBalanceAmount);
        By elPhotoHeader5 = SelectByClassName.CreateByElementByContainsClassName("tw-bg-nlb-omnichannel-photo-header");
        WaitHelpers.WaitForElement(elPhotoHeader5);
        WebElement elementForPhotoHeader5 = SelectByXpath.CreateElementBy(elPhotoHeader5);
        assertTrue(elementForPhotoHeader5.isDisplayed());
    }

    @And("Click on date {int} days in the future in second payment screen")
    public void clickOnDateDaysInTheFutureInSecondPaymentScreen(int daysInFuture) throws Throwable {
        String dateInFuture = ActionApiHelpers.getTodayDatePlusXDaysInFormat(daysInFuture, "dd.MM.YYYY");
        String date = hp.returnDateInSlovenianFormat(dateInFuture);
        //String xPath = "//*[@aria-label='"+date+"']";
        String xPath = "//*[@aria-label='" + date + "' and not(contains(@class, 'hidden'))]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Assert date {int} days in future in payment review")
    public void assertDateDaysInFutureInPaymentReview(int daysInFuture) throws Throwable {
        String expectedDate = ActionApiHelpers.getTodayDatePlusXDaysInFormat(daysInFuture, "dd.MM.YYYY");
        String xPathForElementAssert = "//*[contains(text(),'Payment date')]//following-sibling::*";
        WebElement elementForAssert = SelectByXpath.CreateElementByXpath(xPathForElementAssert);
        assertEquals(expectedDate, elementForAssert.getAttribute("textContent"));
    }

    @And("Assert that payment under key {string} from txt file has date {int} days in future")
    public void assertThatPaymentUnderKeyFromTxtFileHasDateDaysInFuture(String key, int daysInFuture) throws Throwable {
        String expectedDate = ActionApiHelpers.getTodayDatePlusXDaysInFormat(daysInFuture, "dd.MM.YYYY");
        String purpose = Utilities.getDataFromTxtFileUnderKey(key);
        String xPathForPaymentDate = "//div[contains(text(),'" + purpose + "')]//ancestor::nlb-payment-item//*[contains(text(),'" + expectedDate + "')]";
        By elWait = SelectByXpath.CreateByElementByXpath(xPathForPaymentDate);
        WaitHelpers.WaitForElement(elWait);
        WebElement elementForPaymentDate = SelectByXpath.CreateElementBy(elWait);
        assertTrue(elementForPaymentDate.isDisplayed());
    }

    @And("Assert date {int} days in the future in second payment screen is disabled")
    public void assertDateDaysInTheFutureInSecondPaymentScreenIsDisabled(int daysInFuture) throws Throwable {
        String dateInFuture = ActionApiHelpers.getTodayDatePlusXDaysInFormat(daysInFuture, "dd.MM.YYYY");
        String date = hp.returnDateInSlovenianFormat(dateInFuture);
        String xPath = "//*[@aria-label='" + date + "']";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.getAttribute("className").contains("disabled"));
    }

    @And("Click on element by tag {string} and descendant tag {string} contains text {string}")
    public void clickOnElementByTagAndDescendantTagContainsText(String tag, String descendantTag, String descendantText) throws Throwable {
        String xPath = "//" + tag + "//" + descendantTag + "[contains(text(),'" + descendantText + "')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Assert value {string} in label with text {string} with following sibling {string} that has descendant {string}")
    public void assertValueInLabelWithTextWithFollowingSiblingThatHasDescendant(String expectedValue, String labelText, String siblingTag, String descendantTag) throws Throwable {
        String xPathForAssertElement = "//label[text()='" + labelText + "']//following-sibling::" + siblingTag + "//" + descendantTag + "";
        WebElement elementForAssert = SelectByXpath.CreateElementByXpath(xPathForAssertElement);
        assertEquals(expectedValue, elementForAssert.getAttribute("value"));
    }

    @And("Assert max length is {string} in label with text {string} with following sibling {string} that has descendant {string}")
    public void assertMaxLengthIsInLabelWithTextWithFollowingSiblingThatHasDescendant(String expectedMaxLength, String labelText, String siblingTag, String descendantTag) throws Throwable {
        String xPathForAssertElement = "//label[text()='" + labelText + "']//following-sibling::" + siblingTag + "//" + descendantTag + "";
        WebElement elementForAssert = SelectByXpath.CreateElementByXpath(xPathForAssertElement);
        assertEquals(expectedMaxLength, elementForAssert.getAttribute("maxlength"));
    }

    @And("Enter otp in field for One Time Password using data from Excel {string} for pin {string}")
    public void enterOtpInFieldForOneTimePassword(String rowindex, String columnName) throws Throwable {
        String xPathForOTP = "//label[text()='One time password OTP']//following-sibling::div//input";
        if (DataManager.getDataFromHashDatamap(rowindex, "isMock").equals("1")) {
            System.out.println("Ova metoda nije potrebna");
        } else {
            WebElement element = SelectByXpath.CreateElementByXpath(xPathForOTP);
            String pin = DataManager.getDataFromHashDatamap(rowindex, columnName);
            ma.getMobileOTP(pin);
            String text = DataManager.userObject.get("OTP").toString();
            hp.EnterTextToElement(element, text);
        }
    }

    @And("Enter text from Excel {string} columnName {string} into label with text {string} with following sibling {string} that has descendant {string}")
    public void enterTextFromExcelColumnNameIntoLabelWithTextWithFollowingSiblingThatHasDescendant(String rowindex, String columnName, String labelText, String siblingTag, String descendantTag) throws Throwable {
        String xPathForAssertElement = "//label[text()='" + labelText + "']//following-sibling::" + siblingTag + "//" + descendantTag + "";
        WebElement elementForAssert = SelectByXpath.CreateElementByXpath(xPathForAssertElement);
        String textToEnter = DataManager.getDataFromHashDatamap(rowindex, columnName);
        hp.EnterTextToElement(elementForAssert, textToEnter);
    }

    @And("Enter otp in field for One Time Password using data from Excel {string} for pin {string} while waiting for {string} seconds")
    public void enterOtpInFieldForOneTimePasswordUsingDataFromExcelForPinWhileWaitingForSeconds(String rowindex, String columnName, String waitTime) throws Throwable {
        String xPathForOTP = "//label[text()='One time password OTP']//following-sibling::div//input";
        if (DataManager.getDataFromHashDatamap(rowindex, "isMock").equals("1")) {
            System.out.println("Ova metoda nije potrebna");
        } else {
            WebElement element = SelectByXpath.CreateElementByXpath(xPathForOTP);
            String pin = DataManager.getDataFromHashDatamap(rowindex, columnName);
            ma.getMobileOTP(pin);
            String text = DataManager.userObject.get("OTP").toString();
            int time = Integer.parseInt(waitTime);
            WaitHelpers.waitForSeconds(time);
            hp.EnterTextToElement(element, text);
        }
    }

    @And("Login to the page using user from Excel {string} columnName {string}")
    public void loginToThePageUsingUserFromExcelColumnName(String rowindex, String columnName) throws Throwable {
        String username = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String isMocked = DataManager.getDataFromHashDatamap(rowindex, "isMock");
        String pin = DataManager.getDataFromHashDatamap(rowindex, "pin");
        String env = DataManager.getDataFromHashDatamap(rowindex, "currentEnv");
        rh.loginToThePageUsingUserFromExcelColumnName(username, isMocked, pin, env);
    }

    @And("Click on button with descendant tag {string} contains text {string}")
    public void clickOnButtonWithDescendantTagContainsText(String descendantTag, String text) throws Throwable {
        String xPath = "//button//" + descendantTag + "[contains(text(),'" + text + "')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Select country {string} as recipient country")
    public void selectCountryAsRecipientCountry(String selectedCountry) throws Throwable {
        String xPathForEntryField = "(//label[contains(text(),'Country')]//following-sibling::div//input)[1]";
        WebElement elementForEntryField = SelectByXpath.CreateElementByXpath(xPathForEntryField);
        hp.ClickOnElement(elementForEntryField);
        String xPathForCountry = "(//*[contains(text(),'" + selectedCountry + "')])[1]";
        WebElement elementForCountry = SelectByXpath.CreateElementByXpath(xPathForCountry);
        hp.ClickOnElement(elementForCountry);
    }

    @And("Assert swift code {string} in second step of payment")
    public void assertSwiftCodeInSecondStepOfPayment(String swift) throws Throwable {
        String xPathForEntryField = "(//label[contains(text(),'SWIFT (BIC) Code')]//following-sibling::div//input)[1]";
        WebElement elementForSwiftField = SelectByXpath.CreateElementByXpath(xPathForEntryField);
        assertEquals(swift, elementForSwiftField.getAttribute("value"));
        assertEquals("11", elementForSwiftField.getAttribute("maxlength"));
    }

    @And("Select country {string} as recipient bank country")
    public void selectCountryAsRecipientBankCountry(String selectedCountry) throws Throwable {
        String xPathForEntryField = "(//label[contains(text(),'Country')]//following-sibling::div//input)[2]";
        WebElement elementForEntryField = SelectByXpath.CreateElementByXpath(xPathForEntryField);
        hp.ClickOnElement(elementForEntryField);
        String xPathForCountry = "(//*[contains(text(),'" + selectedCountry + "')])[2]";
        WebElement elementForCountry = SelectByXpath.CreateElementByXpath(xPathForCountry);
        hp.ClickOnElement(elementForCountry);
    }

    @And("Enter text {string} into Amount field in second step of payment")
    public void enterTextIntoAmountFieldInSecondStepOfPayment(String amount) throws Throwable {
        String xPathForAssertElement = "(//label[text()='Amount ']//following-sibling::div//input)[1]";
        WebElement elementForAssert = SelectByXpath.CreateElementByXpath(xPathForAssertElement);
        hp.deleteTextFromFieldLonger(elementForAssert);
        hp.EnterTextToElement(elementForAssert, amount);
    }

    @And("Delete text in label contains text {string} with following sibling {string} that has descendant {string}")
    public void deleteTextInLabelContainsTextWithFollowingSiblingThatHasDescendant(String labelText, String siblingTag, String descendantTag) throws Throwable {
        String xPathForEntryField = "//label[contains(text(),'" + labelText + "')]//following-sibling::" + siblingTag + "//" + descendantTag + "";
        WebElement element = SelectByXpath.CreateElementByXpath(xPathForEntryField);
        hp.DeleteTextFromElement(element);
    }

    @And("Assert {string} category of a split transaction is {string}")
    public void assertCategoryOfASplitTransactionIs(String occurence, String categoryName) throws Throwable {
        String xPath = "(//input[@placeholder='Select category'])[" + occurence + "]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertEquals(categoryName, element.getAttribute("value"));
    }

    @When("Check env {string} and click on element by tag {string} contains class {string} if env is TST")
    public void checkEnvAndClickOnElementByTagContainsClassIfEnvIsTST(String rowindex, String tag, String className) throws Throwable {
        String env = DataManager.getDataFromHashDatamap(rowindex, "currentEnv");
        if (env.equals("tst")) {
            WebElement element = SelectByXpath.CreateElementByXPathTagContainsClass(tag, className);
            hp.ClickOnElement(element);
        }
    }

    @And("CLick on tag {string} with text {string} that has ancestor tag {string}")
    public void clickOnTagWithTextThatHasAncestorTag(String tag, String text, String ancestorTag) throws Throwable {
        WebElement element = SelectByXpath.CreateElementByTagWithTextWithAncestorTag(tag, text, ancestorTag);
        hp.ClickOnElement(element);
    }

    @And("Assert {string} field with placeholder {string}")
    public void assertFieldWithPlaceholder(String tag, String placeholder) throws Throwable {
        WebElement element = SelectByXpath.CreateElementByXpath("//" + tag + "[@placeholder='" + placeholder + "']");
        assertTrue(element.isDisplayed());
    }

    @And("Assert all contacts are sorted alphabetically")
    public void assertAllContactsAreSortedAlphabetically() throws Throwable {
        rh.assertAllContactsAreSortedAlphabetically();
    }

    @And("Assert that contact is shown correctly using text for icon {string} and Excel {string} values {string} {string}")
    public void assertThatContactIsShownCorrectlyUsingTextForIconAndExcelValues(String iconText, String rowindex, String columnName1, String columnName2) throws Throwable {
        String accountName = DataManager.getDataFromHashDatamap(rowindex, columnName1);
        String accountIban = DataManager.getDataFromHashDatamap(rowindex, columnName2);

        String xPath = "//nlb-contact-item//div[contains(text(),'" + iconText + "')]//following-sibling::div//div[contains(text(),'" + accountName + "')]//following-sibling::div[contains(text(),'" + accountIban + "')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
    }

    @And("Assert element with text {string} has following sibling tag {string} with attribute {string} from Excel {string} {string}")
    public void assertElementWithTextHasFollowingSiblingTagWithAttributeFromExcel(String text, String siblingTag, String attribute, String rowindex, String columnName) throws Throwable {
        String address = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPath = "//*[text()='" + text + "']//following-sibling::" + siblingTag + "";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String actualAddress = element.getAttribute(attribute);
        assertEquals(address, actualAddress);
    }

    @And("Assert there are five last payments")
    public void assertThereAreFiveLastPayments() throws Throwable {
        rh.assertThereAreFiveLastPayments();
    }

    @Then("Enter text from Excel {string} columnName {string} in input field")
    public void enterTextFromExcelColumnNameInInputField(String rowindex, String columnName) throws Throwable {
        String searchValue = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPath = "//input";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        hp.EnterTextToElement(element, searchValue);
    }

    @And("Assert correct contacts are filtered by search using {string} columnName {string}")
    public void assertCorrectContactsAreFilteredBySearchUsingColumnName(String rowindex, String columnName) throws Throwable {
        String text = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPath = "//*[contains(text(),'" + text + "')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());

        rh.assertThereIsOnlyOneShownContact();
    }

    @Then("Assert that product card of name {string} and iban {string} from Excel {string} for vita insurance account are shown correctly")
    public void assertThatProductCardOfNameAndIbanFromExcelForVitaInsuranceAccountAreShownCorrectly(String columnName1, String columnName2, String rowindex) throws Throwable {
        String productName = DataManager.getDataFromHashDatamap(rowindex, columnName1);
        String productIban = DataManager.getDataFromHashDatamap(rowindex, columnName2);
        String xPathForProductCard1 = "//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//*[contains(text(),'Policy value')]";
        String xPathForCurrentBalance = "(//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//nlb-heading-text//span[1])[1]";
        String xPathForCurrentBalanceCurrency = "(//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//nlb-heading-text//span[2])[1]";

        WebElement elementForProductCard1 = SelectByXpath.CreateElementByXpath(xPathForProductCard1);
        assertTrue(elementForProductCard1.isDisplayed());
        WebElement elementForCurrentBalance = SelectByXpath.CreateElementByXpath(xPathForCurrentBalance);
        String stringCurrentBalance = elementForCurrentBalance.getAttribute("innerText");
        assertTrue(stringCurrentBalance.matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{2}"));
        WebElement elementForCurrentBalanceCurrency = SelectByXpath.CreateElementByXpath(xPathForCurrentBalanceCurrency);
        String stringCurrentBalanceCurrency = elementForCurrentBalanceCurrency.getAttribute("innerText");
        assertTrue(stringCurrentBalanceCurrency.contains("EUR"));
    }

    @And("Assert that whole product card of vita insurance account with name {string} and iban {string} from Excel {string} acts as a clickable button")
    public void assertThatWholeProductCardOfVitaInsuranceAccountWithNameAndIbanFromExcelActsAsAClickableButton(String columnName1, String columnName2, String rowindex) throws Throwable {
        String productName = DataManager.getDataFromHashDatamap(rowindex, columnName1);
        String productIban = DataManager.getDataFromHashDatamap(rowindex, columnName2);

        String xPathForProductName = "(//nlb-product-card//*[contains(text(),'" + productName + "')])[1]";
        String xPathForProductIban = "//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]";
        String xPathForCurrentBalance = "//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//*[contains(text(),'Policy value')]";
        String xPathForCurrentBalanceAmount = "(//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//nlb-heading-text//span[1])[1]";

        WebElement elementForProductName = SelectByXpath.CreateElementByXpath(xPathForProductName);
        hp.ClickOnElement(elementForProductName);
        By elPhotoHeader1 = SelectByClassName.CreateByElementByContainsClassName("tw-bg-nlb-omnichannel-photo-header");
        WaitHelpers.WaitForElement(elPhotoHeader1);
        WebElement elementForPhotoHeader1 = SelectByXpath.CreateElementBy(elPhotoHeader1);
        assertTrue(elementForPhotoHeader1.isDisplayed());
        driver.navigate().back();

        By elForProductIban = SelectByXpath.CreateByElementByXpath(xPathForProductIban);
        WaitHelpers.WaitForElement(elForProductIban);
        WebElement elementForProductIban = SelectByXpath.CreateElementBy(elForProductIban);
        JSHelpers.ScrollIntoViewBottom(elementForProductIban);
        hp.ClickOnElement(elementForProductIban);
        By elPhotoHeader2 = SelectByClassName.CreateByElementByContainsClassName("tw-bg-nlb-omnichannel-photo-header");
        WaitHelpers.WaitForElement(elPhotoHeader2);
        WebElement elementForPhotoHeader2 = SelectByXpath.CreateElementBy(elPhotoHeader2);
        assertTrue(elementForPhotoHeader2.isDisplayed());
        driver.navigate().back();

        By elForCurrentBalance = SelectByXpath.CreateByElementByXpath(xPathForCurrentBalance);
        WaitHelpers.WaitForElement(elForCurrentBalance);
        WebElement elementForCurrentBalance = SelectByXpath.CreateElementBy(elForCurrentBalance);
        JSHelpers.ScrollIntoViewBottom(elementForCurrentBalance);
        hp.ClickOnElement(elementForCurrentBalance);
        By elPhotoHeader3 = SelectByClassName.CreateByElementByContainsClassName("tw-bg-nlb-omnichannel-photo-header");
        WaitHelpers.WaitForElement(elPhotoHeader3);
        WebElement elementForPhotoHeader3 = SelectByXpath.CreateElementBy(elPhotoHeader3);
        assertTrue(elementForPhotoHeader3.isDisplayed());
        driver.navigate().back();

        By elForCurrentBalanceAmount = SelectByXpath.CreateByElementByXpath(xPathForCurrentBalanceAmount);
        WaitHelpers.WaitForElement(elForCurrentBalanceAmount);
        WebElement elementForCurrentBalanceAmount = SelectByXpath.CreateElementBy(elForCurrentBalanceAmount);
        JSHelpers.ScrollIntoViewBottom(elementForCurrentBalanceAmount);
        hp.ClickOnElement(elementForCurrentBalanceAmount);
        By elPhotoHeader5 = SelectByClassName.CreateByElementByContainsClassName("tw-bg-nlb-omnichannel-photo-header");
        WaitHelpers.WaitForElement(elPhotoHeader5);
        WebElement elementForPhotoHeader5 = SelectByXpath.CreateElementBy(elPhotoHeader5);
        assertTrue(elementForPhotoHeader5.isDisplayed());
    }

    @Then("Assert that product card of name {string} and iban {string} from Excel {string} for term deposit account are shown correctly")
    public void assertThatProductCardOfNameAndIbanFromExcelForTermDepositAccountAreShownCorrectly(String columnName1, String columnName2, String rowindex) throws Throwable {
        String productName = DataManager.getDataFromHashDatamap(rowindex, columnName1);
        String productIban = DataManager.getDataFromHashDatamap(rowindex, columnName2);
        String xPathForProductCard1 = "//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//*[contains(text(),'Term deposit amount')]";
        String xPathForCurrentBalance = "(//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//nlb-heading-text//span[1])[1]";
        String xPathForCurrentBalanceCurrency = "(//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//nlb-heading-text//span[2])[1]";

        WebElement elementForProductCard1 = SelectByXpath.CreateElementByXpath(xPathForProductCard1);
        assertTrue(elementForProductCard1.isDisplayed());
        WebElement elementForCurrentBalance = SelectByXpath.CreateElementByXpath(xPathForCurrentBalance);
        String stringCurrentBalance = elementForCurrentBalance.getAttribute("innerText");
        assertTrue(stringCurrentBalance.matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{2}"));
        WebElement elementForCurrentBalanceCurrency = SelectByXpath.CreateElementByXpath(xPathForCurrentBalanceCurrency);
        String stringCurrentBalanceCurrency = elementForCurrentBalanceCurrency.getAttribute("innerText");
        assertTrue(stringCurrentBalanceCurrency.contains("EUR"));
    }

    @And("Assert that whole product card of term deposit account with name {string} and iban {string} from Excel {string} acts as a clickable button")
    public void assertThatWholeProductCardOfTermDepositAccountWithNameAndIbanFromExcelActsAsAClickableButton(String columnName1, String columnName2, String rowindex) throws Throwable {
        String productName = DataManager.getDataFromHashDatamap(rowindex, columnName1);
        String productIban = DataManager.getDataFromHashDatamap(rowindex, columnName2);

        String xPathForProductName = "(//nlb-product-card//*[contains(text(),'" + productName + "')])[1]";
        String xPathForProductIban = "//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]";
        String xPathForCurrentBalance = "//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//*[contains(text(),'Term deposit amount')]";
        String xPathForCurrentBalanceAmount = "(//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//nlb-heading-text//span[1])[1]";

        WebElement elementForProductName = SelectByXpath.CreateElementByXpath(xPathForProductName);
        hp.ClickOnElement(elementForProductName);
        By elPhotoHeader1 = SelectByClassName.CreateByElementByContainsClassName("tw-bg-nlb-omnichannel-photo-header");
        WaitHelpers.WaitForElement(elPhotoHeader1);
        WebElement elementForPhotoHeader1 = SelectByXpath.CreateElementBy(elPhotoHeader1);
        assertTrue(elementForPhotoHeader1.isDisplayed());
        driver.navigate().back();

        By elForProductIban = SelectByXpath.CreateByElementByXpath(xPathForProductIban);
        WaitHelpers.WaitForElement(elForProductIban);
        WebElement elementForProductIban = SelectByXpath.CreateElementBy(elForProductIban);
        JSHelpers.ScrollIntoViewBottom(elementForProductIban);
        hp.ClickOnElement(elementForProductIban);
        By elPhotoHeader2 = SelectByClassName.CreateByElementByContainsClassName("tw-bg-nlb-omnichannel-photo-header");
        WaitHelpers.WaitForElement(elPhotoHeader2);
        WebElement elementForPhotoHeader2 = SelectByXpath.CreateElementBy(elPhotoHeader2);
        assertTrue(elementForPhotoHeader2.isDisplayed());
        driver.navigate().back();

        By elForCurrentBalance = SelectByXpath.CreateByElementByXpath(xPathForCurrentBalance);
        WaitHelpers.WaitForElement(elForCurrentBalance);
        WebElement elementForCurrentBalance = SelectByXpath.CreateElementBy(elForCurrentBalance);
        JSHelpers.ScrollIntoViewBottom(elementForCurrentBalance);
        hp.ClickOnElement(elementForCurrentBalance);
        By elPhotoHeader3 = SelectByClassName.CreateByElementByContainsClassName("tw-bg-nlb-omnichannel-photo-header");
        WaitHelpers.WaitForElement(elPhotoHeader3);
        WebElement elementForPhotoHeader3 = SelectByXpath.CreateElementBy(elPhotoHeader3);
        assertTrue(elementForPhotoHeader3.isDisplayed());
        driver.navigate().back();

        By elForCurrentBalanceAmount = SelectByXpath.CreateByElementByXpath(xPathForCurrentBalanceAmount);
        WaitHelpers.WaitForElement(elForCurrentBalanceAmount);
        WebElement elementForCurrentBalanceAmount = SelectByXpath.CreateElementBy(elForCurrentBalanceAmount);
        JSHelpers.ScrollIntoViewBottom(elementForCurrentBalanceAmount);
        hp.ClickOnElement(elementForCurrentBalanceAmount);
        By elPhotoHeader5 = SelectByClassName.CreateByElementByContainsClassName("tw-bg-nlb-omnichannel-photo-header");
        WaitHelpers.WaitForElement(elPhotoHeader5);
        WebElement elementForPhotoHeader5 = SelectByXpath.CreateElementBy(elPhotoHeader5);
        assertTrue(elementForPhotoHeader5.isDisplayed());
    }

    @Then("Assert that product card of name {string} and iban {string} from Excel {string} for nlb funds account are shown correctly")
    public void assertThatProductCardOfNameAndIbanFromExcelForNlbFundsAccountAreShownCorrectly(String columnName1, String columnName2, String rowindex) throws Throwable {
        String productName = DataManager.getDataFromHashDatamap(rowindex, columnName1);
        String productIban = DataManager.getDataFromHashDatamap(rowindex, columnName2);
        String xPathForProductCard1 = "//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//*[contains(text(),'Current balance')]";
        String xPathForProductCard2 = "//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//*[contains(text(),'Number of asset units')]";
        String xPathForCurrentBalance = "(//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//nlb-heading-text//span[1])[1]";
        String xPathForBookedBalance = "(//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//nlb-heading-text//span[1])[2]";
        String xPathForCurrentBalanceCurrency = "(//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//nlb-heading-text//span[2])[1]";
        String xPathForBookedBalanceCurrency = "(//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//nlb-heading-text//span[2])[1]";

        WebElement elementForProductCard1 = SelectByXpath.CreateElementByXpath(xPathForProductCard1);
        assertTrue(elementForProductCard1.isDisplayed());
        WebElement elementForProductCard2 = SelectByXpath.CreateElementByXpath(xPathForProductCard2);
        assertTrue(elementForProductCard2.isDisplayed());
        WebElement elementForCurrentBalance = SelectByXpath.CreateElementByXpath(xPathForCurrentBalance);
        String stringCurrentBalance = elementForCurrentBalance.getAttribute("innerText");
        assertTrue(stringCurrentBalance.matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{2}"));
        WebElement elementForBookedBalance = SelectByXpath.CreateElementByXpath(xPathForBookedBalance);
        String stringBookedBalance = elementForBookedBalance.getAttribute("innerText");
        assertTrue(stringBookedBalance.matches("^-?\\d+,\\d{6}$"));
        WebElement elementForCurrentBalanceCurrency = SelectByXpath.CreateElementByXpath(xPathForCurrentBalanceCurrency);
        String stringCurrentBalanceCurrency = elementForCurrentBalanceCurrency.getAttribute("innerText");
        assertTrue(stringCurrentBalanceCurrency.contains("EUR"));
        WebElement elementForBookedBalanceCurrency = SelectByXpath.CreateElementByXpath(xPathForBookedBalanceCurrency);
        String stringBookedBalanceCurrency = elementForBookedBalanceCurrency.getAttribute("innerText");
        assertTrue(stringBookedBalanceCurrency.contains("EUR"));
    }

    @And("Assert that whole product card of nlb funds account with name {string} and iban {string} from Excel {string} acts as a clickable button")
    public void assertThatWholeProductCardOfNlbFundsAccountWithNameAndIbanFromExcelActsAsAClickableButton(String columnName1, String columnName2, String rowindex) throws Throwable {
        String productName = DataManager.getDataFromHashDatamap(rowindex, columnName1);
        String productIban = DataManager.getDataFromHashDatamap(rowindex, columnName2);

        String xPathForProductName = "(//nlb-product-card//*[contains(text(),'" + productName + "')])[1]";
        String xPathForProductIban = "//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]";
        String xPathForCurrentBalance = "//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//*[contains(text(),'Current balance')]";
        String xPathForBookedBalance = "//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//*[contains(text(),'Number of asset units')]";
        String xPathForCurrentBalanceAmount = "(//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//nlb-heading-text//span[1])[1]";
        String xPathForBookedBalanceAmount = "(//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//nlb-heading-text//span[1])[2]";

        WebElement elementForProductName = SelectByXpath.CreateElementByXpath(xPathForProductName);
        hp.ClickOnElement(elementForProductName);
        By elPhotoHeader1 = SelectByClassName.CreateByElementByContainsClassName("tw-bg-nlb-omnichannel-photo-header");
        WaitHelpers.WaitForElement(elPhotoHeader1);
        WebElement elementForPhotoHeader1 = SelectByXpath.CreateElementBy(elPhotoHeader1);
        assertTrue(elementForPhotoHeader1.isDisplayed());
        driver.navigate().back();

        By elForProductIban = SelectByXpath.CreateByElementByXpath(xPathForProductIban);
        WaitHelpers.WaitForElement(elForProductIban);
        WebElement elementForProductIban = SelectByXpath.CreateElementBy(elForProductIban);
        JSHelpers.ScrollIntoViewBottom(elementForProductIban);
        hp.ClickOnElement(elementForProductIban);
        By elPhotoHeader2 = SelectByClassName.CreateByElementByContainsClassName("tw-bg-nlb-omnichannel-photo-header");
        WaitHelpers.WaitForElement(elPhotoHeader2);
        WebElement elementForPhotoHeader2 = SelectByXpath.CreateElementBy(elPhotoHeader2);
        assertTrue(elementForPhotoHeader2.isDisplayed());
        driver.navigate().back();

        By elForCurrentBalance = SelectByXpath.CreateByElementByXpath(xPathForCurrentBalance);
        WaitHelpers.WaitForElement(elForCurrentBalance);
        WebElement elementForCurrentBalance = SelectByXpath.CreateElementBy(elForCurrentBalance);
        JSHelpers.ScrollIntoViewBottom(elementForCurrentBalance);
        hp.ClickOnElement(elementForCurrentBalance);
        By elPhotoHeader3 = SelectByClassName.CreateByElementByContainsClassName("tw-bg-nlb-omnichannel-photo-header");
        WaitHelpers.WaitForElement(elPhotoHeader3);
        WebElement elementForPhotoHeader3 = SelectByXpath.CreateElementBy(elPhotoHeader3);
        assertTrue(elementForPhotoHeader3.isDisplayed());
        driver.navigate().back();

        By elForBookedBalance = SelectByXpath.CreateByElementByXpath(xPathForBookedBalance);
        WaitHelpers.WaitForElement(elForBookedBalance);
        WebElement elementForBookedBalance = SelectByXpath.CreateElementBy(elForBookedBalance);
        JSHelpers.ScrollIntoViewBottom(elementForBookedBalance);
        hp.ClickOnElement(elementForBookedBalance);
        By elPhotoHeader4 = SelectByClassName.CreateByElementByContainsClassName("tw-bg-nlb-omnichannel-photo-header");
        WaitHelpers.WaitForElement(elPhotoHeader4);
        WebElement elementForPhotoHeader4 = SelectByXpath.CreateElementBy(elPhotoHeader4);
        assertTrue(elementForPhotoHeader4.isDisplayed());
        driver.navigate().back();

        By elForCurrentBalanceAmount = SelectByXpath.CreateByElementByXpath(xPathForCurrentBalanceAmount);
        WaitHelpers.WaitForElement(elForCurrentBalanceAmount);
        WebElement elementForCurrentBalanceAmount = SelectByXpath.CreateElementBy(elForCurrentBalanceAmount);
        JSHelpers.ScrollIntoViewBottom(elementForCurrentBalanceAmount);
        hp.ClickOnElement(elementForCurrentBalanceAmount);
        By elPhotoHeader5 = SelectByClassName.CreateByElementByContainsClassName("tw-bg-nlb-omnichannel-photo-header");
        WaitHelpers.WaitForElement(elPhotoHeader5);
        WebElement elementForPhotoHeader5 = SelectByXpath.CreateElementBy(elPhotoHeader5);
        assertTrue(elementForPhotoHeader5.isDisplayed());
        driver.navigate().back();

        By elForBookedBalanceAmount = SelectByXpath.CreateByElementByXpath(xPathForBookedBalanceAmount);
        WaitHelpers.WaitForElement(elForBookedBalanceAmount);
        WebElement elementForBookedBalanceAmount = SelectByXpath.CreateElementBy(elForBookedBalanceAmount);
        JSHelpers.ScrollIntoViewBottom(elementForBookedBalanceAmount);
        hp.ClickOnElement(elementForBookedBalanceAmount);
        By elPhotoHeader6 = SelectByClassName.CreateByElementByContainsClassName("tw-bg-nlb-omnichannel-photo-header");
        WaitHelpers.WaitForElement(elPhotoHeader6);
        WebElement elementForPhotoHeader6 = SelectByXpath.CreateElementBy(elPhotoHeader6);
        assertTrue(elementForPhotoHeader6.isDisplayed());
    }

    @And("Scroll element by tag {string} contains text {string} into bottom view")
    public void scrollElementByTagContainsTextIntoBottomView(String tag, String text) throws Throwable {
        WebElement element = SelectByXpath.CreateElementByXpathTagContainsText(tag, text);
        JSHelpers.ScrollIntoViewBottom(element);
    }

    @And("Change language to English")
    public void changeLanguageToEnglish() throws Throwable {
        String xPathIconMenu = "//*[contains(@class,'icon-menu')]";
        WebElement elementForIconMenu = SelectByXpath.CreateElementByXpath(xPathIconMenu);
        hp.ClickOnElement(elementForIconMenu);
        String xPathForSLO = "//*[text()='Slovenščina']";
        WebElement elementForSLO = SelectByXpath.CreateElementByXpath(xPathForSLO);
        hp.ClickOnElement(elementForSLO);
        String xPathForEnglish = "//*[text()=' English ']";
        WebElement elementForEnglish = SelectByXpath.CreateElementByXpath(xPathForEnglish);
        hp.ClickOnElement(elementForEnglish);
        String xPathForOk = "//*[text()='V redu']";
        WebElement elementForOk = SelectByXpath.CreateElementByXpath(xPathForOk);
        hp.ClickOnElement(elementForOk);
    }

    @And("Use mobile app to complete payment using account iban from Excel {string} columnName {string} amount {string} and currency {string}")
    public void useMobileAppToCompletePaymentUsingAccountIbanFromExcelColumnNameAmountAndCurrency(String rowindex, String columnName, String amount, String currency) throws Throwable {
        String accountIban = DataManager.getDataFromHashDatamap(rowindex, columnName);
        rh.useMobileAppToCompletePayment(accountIban, amount, currency);
    }

    @And("Assert that transaction in opened payment under key {string} has cancel payment button")
    public void assertThatTransactionInOpenedPaymentUnderKeyHasCancelPaymentButton(String key) throws Throwable {
        String purpose = Utilities.getDataFromTxtFileUnderKey(key);
        String xPath = "//*[text()='" + purpose + "']//ancestor::nlb-payment-item//*[text()='Cancel payment']";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
    }

    @Then("Assert that transaction {string} in opened payment does not exist")
    public void assertThatTransactionInOpenedPaymentDoesNotExist(String text) throws Throwable {
        String xPathForDataCheck = "(//*[text()='" + text + "']//following-sibling::div)[2]";
        By el = SelectByXpath.CreateByElementByXpath(xPathForDataCheck);
        boolean isDisplayed = ActionApiHelpers.isElementDisplayed(el);
        assertFalse(isDisplayed);
    }

    @And("Assert timebar in payment confirmation is correct")
    public void assertTimebarInPaymentConfirmationIsCorrect() throws Throwable {
        String xPath = "//div[contains(@class,'round-time-bar') and @style='--duration: 180;']";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
    }

    @And("Assert element by text {string} has following sibling {string} with text from Excel {string} columnName {string}")
    public void assertElementByTextHasFollowingSiblingWithTextFromExcelColumnName(String text, String followingSiblingTag, String rowindex, String columnName) throws Throwable {
        String followingSiblingText = DataManager.getDataFromHashDatamap(rowindex, columnName);
        WebElement element = SelectByXpath.CreateElementByXpathTextFollowingSibling(text, followingSiblingTag);
        assertEquals(followingSiblingText, element.getAttribute("textContent"));
    }

    @And("Assert element by text {string} has following sibling {string} with text {string}")
    public void assertElementByTextHasFollowingSiblingWithText(String text, String followingSiblingTag, String expectedText) throws Throwable {
        WebElement element = SelectByXpath.CreateElementByXpathTextFollowingSibling(text, followingSiblingTag);
        assertEquals(expectedText, element.getAttribute("textContent"));
    }

    @And("Use mobile app to complete payment using wrong pin")
    public void useMobileAppToCompletePaymentUsingWrongPin() throws Throwable {
        rh.useMobileAppToCompletePaymentUsingWrongPin();
    }

    @And("Use mobile app to complete payment after expiration")
    public void useMobileAppToCompletePaymentAfterExpiration() throws Throwable {
        rh.useMobileAppToCompletePaymentAfterExpiration();
    }

    @And("Use mobile app to reject payment")
    public void useMobileAppToRejectPayment() throws Throwable {
        rh.useMobileAppToRejectPayment();
    }

    @And("Wait for first product to load")
    public void waitForFirstProductToLoad() throws InterruptedException {
        String xPath = "(//nlb-product-card//nlb-heading-text/following-sibling::div[1])[1]";
        By element = SelectByXpath.CreateByElementByXpath(xPath);
        WaitHelpers.WaitForElement(element);
    }

    @And("Click on element by containing text from Excel {string} columnName {string}")
    public void clickOnElementByContainingTextFromExcelColumnName(String rowindex, String columnName) throws Throwable {
        String text = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPath = "//*[contains(text(),'" + text + "')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Wait for element by tag {string}")
    public void waitForElementByTag(String tag) throws InterruptedException {
        String xPath = "//" + tag;
        By element = SelectByXpath.CreateByElementByXpath(xPath);
        WaitHelpers.WaitForElement(element);
    }

    @And("Assert Product name in Product details is from Excel {string} columnName {string}")
    public void assertProductNameInProductDetailsIsFromExcelColumnName(String rowindex, String columnName) throws Throwable {
        String accName = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPath = "(//nlb-product-detail-header//nlb-heading-text[1])[1]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertEquals(accName, element.getAttribute("innerText"));
        assertTrue(element.isDisplayed());
    }

    @And("Assert Product IBAN in Product details is from Excel {string} columnName {string}")
    public void assertProductIBANInProductDetailsIsFromExcelColumnName(String rowindex, String columnName) throws Throwable {
        String accName = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPath = "//nlb-iban";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertEquals(accName, element.getAttribute("innerText"));
        assertTrue(element.isDisplayed());
    }

    @And("Assert Product icon in Product details is displayed and has icon path {string}")
    public void assertProductIconInProductDetailsIsDisplayedAndHasIconPath(String iconPath) throws Throwable {
        String xPath = "//nlb-product-icon/img";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
        assertEquals(iconPath, element.getAttribute("src"));
    }

    @And("Assert EUR currency is selected if product has more than one currency")
    public void assertEURCurrencyIsSelectedIfProductHasMoreThanOneCurrency() throws Throwable {
        List<WebElement> elements = driver.findElements(By.xpath("//nlb-account-balance-card"));

        if (elements.isEmpty()) {
            System.out.println("Element not found.");
        } else {
            String xpath = "//nlb-amount[contains(@class, 'tw-text-primaryColor')]//span[2]";
            WebElement element = SelectByXpath.CreateElementByXpath(xpath);
            assertEquals("EUR", element.getAttribute("innerText"));
        }
    }

    @And("Assert currency cards have Current balance displayed correctly")
    public void assertCurrencyCardsHaveCurrentBalanceDisplayedCorrectly() throws Throwable {
        String currentEnv = DataManager.getDataFromHashDatamap("1", "currentEnv");
        if (currentEnv.equals("uat")){
            List<WebElement> elements = driver.findElements(By.xpath("//nlb-account-balance-card"));

            ArrayList<String> expectedCurrencies = RoutineHelper.getCurrenciesExceptEUR();


            if (elements.isEmpty()) {
                System.out.println("Element not found.");
            } else {
                String currentBalanceTitlexPath = "//nlb-account-balance-card//nlb-heading-text//dl//dt";
                List<WebElement> currentBalanceTitle = SelectByXpath.CreateElementsByXpath(currentBalanceTitlexPath);
                for (WebElement element : currentBalanceTitle) {
                    assertEquals("Current balance", element.getAttribute("innerText"));
                }

                String amountxPath = "//nlb-account-balance-card//nlb-heading-text//dl//nlb-amount//span[1]";
                List<WebElement> amountElements = SelectByXpath.CreateElementsByXpath(amountxPath);
                for (WebElement element : amountElements) {
                    assertTrue(element.getAttribute("innerText").matches("(?:\\u2212?(?:0|[1-9]\\d{0,2})(?:\\.\\d{3})*),\\d{2}"));
                }

                String currencyxPath = "//nlb-account-balance-card//nlb-heading-text//dl//nlb-amount//span[2]";
                List<WebElement> currencyElements = SelectByXpath.CreateElementsByXpath(currencyxPath);
                int numOfCurrency = currencyElements.size();
                for (int i = 0; i < numOfCurrency; i++) {
                    if (i == 0) {
                        assertEquals("EUR", currencyElements.get(i).getAttribute("innerText"));
                    } else {
                        assertTrue(expectedCurrencies.contains(currencyElements.get(i).getAttribute("innerText")));
                    }

                }

                String xpath = "//nlb-amount[contains(@class, 'tw-text-primaryColor')]//span[2]";
                WebElement element = SelectByXpath.CreateElementByXpath(xpath);
                assertEquals("EUR", element.getAttribute("innerText"));
            }
        }
        if (currentEnv.equals("tst")){
            List<WebElement> elements = driver.findElements(By.xpath("//nlb-account-balance-card"));

            ArrayList<String> expectedCurrencies = RoutineHelper.getCurrenciesExceptEUR();


            if (elements.isEmpty()) {
                System.out.println("Element not found.");
            } else {
                String currentBalanceTitlexPath = "//nlb-account-balance-card/dl/nlb-heading-text/div/dt";
                List<WebElement> currentBalanceTitle = SelectByXpath.CreateElementsByXpath(currentBalanceTitlexPath);
                for (WebElement element : currentBalanceTitle) {
                    assertEquals("Current balance", element.getAttribute("innerText"));
                }

                String amountxPath = "//nlb-account-balance-card//nlb-heading-text[1]//div/dd/nlb-amount/div/span[1]";
                List<WebElement> amountElements = SelectByXpath.CreateElementsByXpath(amountxPath);
                for (WebElement element : amountElements) {
                    assertTrue(element.getAttribute("innerText").matches("(?:\\u2212?(?:0|[1-9]\\d{0,2})(?:\\.\\d{3})*),\\d{2}"));
                }

                String currencyxPath = "//nlb-account-balance-card//nlb-heading-text[1]//div/dd/nlb-amount/div/span[2]";
                List<WebElement> currencyElements = SelectByXpath.CreateElementsByXpath(currencyxPath);
                int numOfCurrency = currencyElements.size();
                for (int i = 0; i < numOfCurrency; i++) {
                    if (i == 0) {
                        assertEquals("EUR", currencyElements.get(i).getAttribute("innerText"));
                    } else {
                        assertTrue(expectedCurrencies.contains(currencyElements.get(i).getAttribute("innerText")));
                    }

                }

                String xpath = "//nlb-amount[contains(@class, 'tw-text-primaryColor')]//span[2]";
                WebElement element = SelectByXpath.CreateElementByXpath(xpath);
                assertEquals("EUR", element.getAttribute("innerText"));
            }
        }

    }

    @And("Assert available balance and converted value are displayed correctly in Product details")
    public void assertAvailableBalanceAndConvertedValueAreDisplayedCorrectlyInProductDetails() throws Throwable {
        List<WebElement> elements = driver.findElements(By.xpath("//nlb-account-balance-card"));

        if (elements.isEmpty()) {
            System.out.println("Element not found.");
        } else {


            String titlexPath = "//nlb-account-balance-card//nlb-heading-text/following-sibling::div//dt[contains(@class,'tw-text-gray-400')]";
            List<WebElement> titleElements = SelectByXpath.CreateElementsByXpath(titlexPath);
            int numOfTitles = titleElements.size();
            assertTrue(numOfTitles > 0);
            for (int i = 0; i < numOfTitles; i++) {
                if (i == 0) {
                    assertEquals("Available balance", titleElements.get(i).getAttribute("innerText"));
                } else {
                    assertEquals("Converted value", titleElements.get(i).getAttribute("innerText"));
                }
            }

            String amountxPath = "//nlb-account-balance-card//nlb-heading-text/following-sibling::div//nlb-amount//span[1]";
            List<WebElement> amountElements = SelectByXpath.CreateElementsByXpath(amountxPath);
            for (WebElement element : amountElements) {
                assertTrue(element.getAttribute("innerText").matches("(?:(?:0|[1-9]\\d{0,2})(?:\\.\\d{3})*),\\d{2}"));
            }

            String currencyxPath = "//nlb-account-balance-card//nlb-heading-text/following-sibling::div//nlb-amount//span[2]";
            List<WebElement> currencyElements = SelectByXpath.CreateElementsByXpath(currencyxPath);
            for (WebElement element : currencyElements) {
                assertEquals("EUR", element.getAttribute("innerText"));
            }

        }
    }

    @And("Assert tabs in Product details are displayed correctly with card settings")
    public void assertTabsInProductDetailsAreDisplayedCorrectlyWithCardSettings() throws Throwable {
        String xPath = "//nlb-tabs//a";
        List<WebElement> tabsElements = SelectByXpath.CreateElementsByXpath(xPath);
        int numOfTabs = tabsElements.size();
        for (int i = 0; i < numOfTabs; i++) {
            if (i == 0) {
                assertEquals("Transactions", tabsElements.get(i).getAttribute("innerText"));
            } else if (i == 1) {
                assertEquals("Card settings", tabsElements.get(i).getAttribute("innerText"));
            } else if (i == 2) {
                assertEquals("Statements", tabsElements.get(i).getAttribute("innerText"));
            } else if (i == 3) {
                assertEquals("Details", tabsElements.get(i).getAttribute("innerText"));
            } else {
                fail("More than 4 tabs are found");
            }
        }

        String defaultSelectedxPath = "//nlb-tabs//a[contains(@class, ' tw-text-primaryColor')]";
        WebElement defaultSelectedElement = SelectByXpath.CreateElementByXpath(defaultSelectedxPath);
        assertEquals("Transactions", defaultSelectedElement.getAttribute("innerText"));
    }

    @And("Wait for first transaction in Product details")
    public void waitForFirstTransactionInProductDetails() throws Throwable {
        String xPath = "(//nlb-transaction-card)[1]";
        By element = SelectByXpath.CreateByElementByXpath(xPath);
        WaitHelpers.WaitForElement(element);

        //suma amount za 1 mesec, trenutno ne radi
//        String xPath1 = "(//nlb-transaction-card//nlb-amount//span[1])[1]";
//        By element1 = SelectByXpath.CreateByElementByXpath(xPath1);
//        WaitHelpers.WaitForElement(element1);
    }

    @And("Scroll to element by tag {string}")
    public void scrollToElementByTag(String tag) throws Throwable {
        WebElement element = SelectByXpath.CreateElementByXpathTag(tag);
        JSHelpers.ScrollIntoViewBottom(element);
    }

    @And("Assert transactions filters are displayed correctly in Products details")
    public void assertTransactionsFiltersAreDisplayedCorrectlyInProductsDetails() throws Throwable {
        String xPath = "//nlb-selected-product-transactions-filters//nlb-circle-button/button";
        List<WebElement> elements = SelectByXpath.CreateElementsByXpath(xPath);
        int numOfFilters = elements.size();
        for (int i = 0; i < numOfFilters; i++) {
            if (i == 0) {
                assertEquals("Open calendar", elements.get(i).getAttribute("aria-label"));
                assertTrue(elements.get(i).isDisplayed());
            } else if (i == 1) {
                assertEquals("Open advanced filters", elements.get(i).getAttribute("aria-label"));
                assertTrue(elements.get(i).isDisplayed());
            } else if (i == 2) {
                assertTrue(elements.get(i).isDisplayed());
            } else if (i == 3) {
                assertEquals("Open search", elements.get(i).getAttribute("aria-label"));
                assertTrue(elements.get(i).isDisplayed());
            } else if (i == 4) {
                assertEquals("Toggle dropdown", elements.get(i).getAttribute("aria-label"));
                assertTrue(elements.get(i).isDisplayed());
            } else {
                fail("More than 5 buttons are found");
            }
        }
    }

    @And("Assert transaction is displayed correctly in Products details")
    public void assertTransactionIsDisplayedCorrectlyInProductsDetails() throws Throwable {
        //icon
        String iconxPath = "(//nlb-transaction-card//i[contains(@class, 'nlb-icon')])[1]";
        WebElement iconElement = SelectByXpath.CreateElementByXpath(iconxPath);
        assertTrue(iconElement.isDisplayed());
        //date
        String datexPath = "(//nlb-transaction-card//div[contains(@class, 'subheadline')][1])[1]";
        WebElement dateElement = SelectByXpath.CreateElementByXpath(datexPath);
        assertTrue(dateElement.isDisplayed());
        assertTrue(dateElement.getAttribute("innerText").matches("^(0[1-9]|[1-2][0-9]|3[01])\\.(0[1-9]|1[0-2])\\.\\d{4}$"));
        //debtor
        String debtorxPath = "(//nlb-transaction-card//div[contains(@class, 'subheadline')][2])[1]";
        WebElement debtorElement = SelectByXpath.CreateElementByXpath(debtorxPath);
        assertTrue(debtorElement.isDisplayed());
        assertFalse(debtorElement.getAttribute("innerText") == null && debtorElement.getAttribute("innerText").trim().isEmpty());
        //purpose
        String purposexPath = "(//nlb-transaction-card//nlb-heading-text/div[contains(@class, 'medium')])[1]";
        WebElement purposeElement = SelectByXpath.CreateElementByXpath(purposexPath);
        assertTrue(debtorElement.isDisplayed());
        assertFalse(purposeElement.getAttribute("innerText") == null && debtorElement.getAttribute("innerText").trim().isEmpty());
        //amount
        String amountxPath = "(//nlb-transaction-card//nlb-amount/div/div[2])[1]";
        //String amountxPath = "(//nlb-transaction-card//nlb-amount/div/span[1])[1]";
        WebElement amountElement = SelectByXpath.CreateElementByXpath(amountxPath);
        assertTrue(amountElement.isDisplayed());
        assertTrue(amountElement.getAttribute("innerText").matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{2}"));
        //currency
        String currencyxPath = "(//nlb-transaction-card//nlb-amount//span[2])[1]";
        WebElement currencyElement = SelectByXpath.CreateElementByXpath(currencyxPath);
        assertTrue(currencyElement.isDisplayed());
        assertEquals("EUR", currencyElement.getAttribute("innerText"));
        //transaction details toggle button
        String trxDetailsxPath = "(//nlb-transaction-card//nlb-icon/i[contains(@class, 'icon-chevron-down')])[1]";
        WebElement trxDetailsElement = SelectByXpath.CreateElementByXpath(trxDetailsxPath);
        assertTrue(trxDetailsElement.isDisplayed());
    }

    @And("Assert amount for month category is displayed in Products details with currency {string}")
    public void assertAmountForMonthCategoryIsDisplayedInProductsDetailsWithCurrency(String currency) throws Throwable {
        //amount
        String amountxPath = "//*[@id=\"tabpanel-0\"]/section/nlb-selected-product-transactions/nlb-transactions-list-view/div/div/div[1]/div/nlb-heading-text/div/nlb-amount/div/span[1]";
        WebElement amountElement = SelectByXpath.CreateElementByXpath(amountxPath);
        assertTrue(amountElement.isDisplayed());
        assertTrue(amountElement.getAttribute("innerText").matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{2}"));
        //currency
        String currencyxPath = "//*[@id=\"tabpanel-0\"]/section/nlb-selected-product-transactions/nlb-transactions-list-view/div/div/div[1]/div/nlb-heading-text/div/nlb-amount/div/span[2]";
        WebElement currencyElement = SelectByXpath.CreateElementByXpath(currencyxPath);
        assertTrue(currencyElement.isDisplayed());
        assertEquals(currency, currencyElement.getAttribute("innerText"));
    }

    @And("Assert there are {int} transactions loaded in Products details")
    public void assertThereAreTransactionsLoadedInProductsDetails(int numOfTrx) throws Throwable {
        List<WebElement> elements = SelectByXpath.CreateElementsByXpath("//nlb-transaction-card");
        int actual = elements.size();
        assertEquals(numOfTrx, actual);
    }

    @And("Scroll dynamic page down {int} times")
    public void scrollDynamicPageDownTimes(int x) {
        JSHelpers.ScrollXPagesOnDynamicLoadingpage(x);
    }

    @And("Assert there are more than {int} transactions loaded in Products details")
    public void assertThereAreMoreThanTransactionsLoadedInProductsDetails(int numOfTrx) throws Throwable {
        List<WebElement> elements = SelectByXpath.CreateElementsByXpath("//nlb-transaction-card");
        int actual = elements.size();
        assertTrue(actual > numOfTrx);
    }

    @And("Assert there are month categories in transactions list in Products details")
    public void assertThereAreMonthCategoriesInTransactionsListInProductsDetails() throws Throwable {
        String xPath = "//nlb-selected-product-transactions/nlb-transactions-list-view//*[contains(@class, 'tw-capitalize')]";
        List<WebElement> elements = SelectByXpath.CreateElementsByXpath(xPath);
        List<String> dates = new ArrayList<>();
        Assert.assertFalse(elements.isEmpty());
        for (WebElement element : elements) {
            dates.add(element.getAttribute("innerText"));
        }
        assertTrue(RoutineHelper.areDatesSortedAscending(dates));
    }

    @And("Assert transaction dates are ordered correctly")
    public void assertTransactionDatesAreOrderedCorrectly() throws Throwable {
        String datexPath = "//nlb-transaction-card//div[contains(@class, 'medium tw-flex tw-items-center tw-text-gray-400 xs:subheadline') and contains(@class,'caption')][1]";
        List<WebElement> webElementList = SelectByXpath.CreateElementsByXpath(datexPath);
        List<String> listOfDates = new ArrayList<>();
        for (WebElement element : webElementList) {
            listOfDates.add(element.getAttribute("innerText"));
        }
        List<String> orderedListOfDates = listOfDates;

        Collections.sort(orderedListOfDates, new Comparator<String>() {
            DateFormat f = new SimpleDateFormat("dd.MM.yyyy");

            @Override
            public int compare(String o1, String o2) {
                try {
                    return f.parse(o1).compareTo(f.parse(o2));
                } catch (ParseException e) {
                    throw new IllegalArgumentException(e);
                }
            }
        });

        Collections.reverse(orderedListOfDates);
        assertEquals(orderedListOfDates, listOfDates);
    }

    @And("Assert transaction is displayed correctly in Products details with currency {string}")
    public void assertTransactionIsDisplayedCorrectlyInProductsDetailsWithCurrency(String currency) throws Throwable {
        //icon
        String iconxPath = "(//nlb-transaction-card//i[contains(@class, 'nlb-icon')])[1]";
        WebElement iconElement = SelectByXpath.CreateElementByXpath(iconxPath);
        assertTrue(iconElement.isDisplayed());
        //date
        String datexPath = "(//nlb-transaction-card//div[contains(@class, 'subheadline')][1])[1]";
        WebElement dateElement = SelectByXpath.CreateElementByXpath(datexPath);
        assertTrue(dateElement.isDisplayed());
        assertTrue(dateElement.getAttribute("innerText").matches("^(0[1-9]|[1-2][0-9]|3[01])\\.(0[1-9]|1[0-2])\\.\\d{4}$"));
        //debtor
        String debtorxPath = "(//nlb-transaction-card//div[contains(@class, 'subheadline')][2])[1]";
        WebElement debtorElement = SelectByXpath.CreateElementByXpath(debtorxPath);
        assertTrue(debtorElement.isDisplayed());
        assertFalse(debtorElement.getAttribute("innerText") == null && debtorElement.getAttribute("innerText").trim().isEmpty());
        //purpose
        String purposexPath = "(//nlb-transaction-card//nlb-heading-text/div[contains(@class, 'medium')])[1]";
        WebElement purposeElement = SelectByXpath.CreateElementByXpath(purposexPath);
        assertTrue(debtorElement.isDisplayed());
        assertFalse(purposeElement.getAttribute("innerText") == null && debtorElement.getAttribute("innerText").trim().isEmpty());
        //amount
        String amountxPath = "(//nlb-transaction-card//nlb-amount/div/div//following-sibling::div)[1]";
        WebElement amountElement = SelectByXpath.CreateElementByXpath(amountxPath);
        assertTrue(amountElement.isDisplayed());
        assertTrue(amountElement.getAttribute("innerText").matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{2}"));
        //currency
        String currencyxPath = "(//nlb-transaction-card//nlb-amount//span[2])[1]";
        WebElement currencyElement = SelectByXpath.CreateElementByXpath(currencyxPath);
        assertTrue(currencyElement.isDisplayed());
        assertEquals(currency, currencyElement.getAttribute("innerText"));
        //transaction details toggle button
        String trxDetailsxPath = "(//nlb-transaction-card//nlb-icon/i[contains(@class, 'icon-chevron-down')])[1]";
        WebElement trxDetailsElement = SelectByXpath.CreateElementByXpath(trxDetailsxPath);
        assertTrue(trxDetailsElement.isDisplayed());
    }

    @And("Scroll to Currency card for {string} in Product details")
    public void scrollToCurrencyCardForInProductDetails(String currency) throws Throwable {
        String xPath = "//span[contains(text(),'" + currency + "')]//ancestor::div[1]/ancestor::nlb-account-balance-card";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        JSHelpers.ScrollIntoViewBottom(element);
    }

    @And("Select Currency card {string} in Product details")
    public void selectCurrencyCardInProductDetails(String currency) throws Throwable {
        String xPath = "//span[contains(text(),'" + currency + "')]//ancestor::div[1]/ancestor::nlb-account-balance-card";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Click on button with aria label {string}")
    public void clickOnButtonWithAriaLabel(String ariaLabel) throws Throwable {
        String xPath = "//button[@aria-label='" + ariaLabel + "']";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Wait for Advanced filters form")
    public void waitForAdvancedFiltersForm() throws InterruptedException {
        String xPath = "//h3[contains(text(), 'Advanced filters')]//ancestor::div[4]";
        By element = SelectByXpath.CreateByElementByXpath(xPath);
        WaitHelpers.WaitForElement(element);

    }

    @And("Assert Advanced filters form title")
    public void assertAdvancedFiltersFormTitle() throws Throwable {
        String xPath = "//h3[contains(text(), 'Advanced filters')]/ancestor::nlb-heading-text";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
    }

    @And("Assert Advanced filters Transaction type title")
    public void assertAdvancedFiltersTransactionTypeTitle() throws Throwable {
        String xPath = "//form/div[1]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
        assertEquals("Transaction type", element.getAttribute("innerText"));
    }

    @And("Assert Advanced filters Transaction types are correct")
    public void assertAdvancedFiltersTransactionTypesAreCorrect() throws Throwable {
        String xPath = "//form/div[2]/nlb-radio-button/label[@class='nlb-radio']";
        List<WebElement> elements = SelectByXpath.CreateElementsByXpath(xPath);
        int listSize = elements.size();
        for (int i = 0; i < listSize; i++) {
            if (i == 0) {
                assertEquals("All", elements.get(i).getAttribute("innerText"));
            } else if (i == 1) {
                assertEquals("Incoming transactions", elements.get(i).getAttribute("innerText"));
            } else if (i == 2) {
                assertEquals("Outgoing transactions", elements.get(i).getAttribute("innerText"));
            } else {
                fail("There are more than 3 options!!!");
            }
            assertTrue(elements.get(i).isDisplayed());
        }
    }

    @And("Assert Advanced filters Amount range title")
    public void assertAdvancedFiltersAmountRangeTitle() throws Throwable {
        String xPath = "//form/div[3]/div[1]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
        assertEquals("Amount", element.getAttribute("innerText"));
    }

    @And("Assert Advanced filters Amount range fields are correct")
    public void assertAdvancedFiltersAmountRangeFieldsAreCorrect() throws Throwable {
        //from title
        String fromTitlexPath = "(//nlb-input-amount-currency//label)[1]";
        WebElement fromTitleElement = SelectByXpath.CreateElementByXpath(fromTitlexPath);
        assertTrue(fromTitleElement.isDisplayed());
        assertEquals("From", fromTitleElement.getAttribute("innerText"));
        //to title
        String toTitlexPath = "(//nlb-input-amount-currency//label)[2]";
        WebElement toTitleElement = SelectByXpath.CreateElementByXpath(toTitlexPath);
        assertTrue(toTitleElement.isDisplayed());
        assertEquals("To", toTitleElement.getAttribute("innerText"));
        //from pre-set amount
        String fromPresetxPath = "//nlb-input-amount-currency//label[contains(text(), 'From')]/following-sibling::div/input[@placeholder='0,00'][1]";
        WebElement fromPresetElement = SelectByXpath.CreateElementByXpath(fromPresetxPath);
        assertTrue(fromPresetElement.isDisplayed());
        //from currency
        String fromCurrencyxPath = "//nlb-input-amount-currency//label[contains(text(), 'From')]/following-sibling::div/input[2]";
        WebElement fromCurrencyElement = SelectByXpath.CreateElementByXpath(fromCurrencyxPath);
        assertTrue(fromCurrencyElement.isDisplayed());
        assertEquals("EUR", fromCurrencyElement.getAttribute("value"));
        //to pre-set amount
        String toPresetPath = "//nlb-input-amount-currency//label[contains(text(), 'To')]/following-sibling::div/input[@placeholder='0,00'][1]";
        WebElement toPresetElement = SelectByXpath.CreateElementByXpath(toPresetPath);
        assertTrue(toPresetElement.isDisplayed());
        //to currency
        String toCurrencyxPath = "//nlb-input-amount-currency//label[contains(text(), 'To')]/following-sibling::div/input[2]";
        WebElement toCurrencyElement = SelectByXpath.CreateElementByXpath(toCurrencyxPath);
        assertTrue(toCurrencyElement.isDisplayed());
        assertEquals("EUR", toCurrencyElement.getAttribute("value"));

    }

    @And("Assert NLB button {string}")
    public void assertNLBButton(String buttonName) throws Throwable {
        String xPath = "//nlb-button/button/div[contains(text(), '" + buttonName + "')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
        assertTrue(element.isEnabled());
        JSHelpers.checkIfWebElementIsClickable(element);
    }

    @And("Assert All is selected in Transaction type by default")
    public void assertAllIsSelectedInTransactionTypeByDefault() throws Throwable {
        String xPath = "//nlb-radio-button//input";
        List<WebElement> elements = SelectByXpath.CreateElementsByXpath(xPath);
        assertTrue(elements.get(0).isSelected());
    }

    @And("Select transaction type {string} in Advanced filters")
    public void selectTransactionTypeInAdvancedFilters(String transactionType) throws Throwable {
        String xPath = "//span[contains(text(), '" + transactionType + "')]//ancestor::nlb-radio-button";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Assert Incoming transactions is selected in Transaction type")
    public void assertIncomingTransactionsIsSelectedInTransactionType() throws Throwable {
        String xPath = "//nlb-radio-button//input";
        List<WebElement> elements = SelectByXpath.CreateElementsByXpath(xPath);
        assertTrue(elements.get(1).isSelected());
    }

    @And("Assert there are only Incoming transactions in transactions list")
    public void assertThereAreOnlyIncomingTransactionsInTransactionsList() throws Throwable {
        String xPath = "//nlb-transaction-card//nlb-amount/div/div[2]";
        List<WebElement> elements = SelectByXpath.CreateElementsByXpath(xPath);
        for (WebElement element : elements) {
            assertTrue(element.getAttribute("innerText").matches("^(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{2}$"));
        }
    }

    @And("Assert there are both incoming and outgoing transactions")
    public void assertThereAreBothIncomingAndOutgoingTransactions() throws Throwable {
        int incoming = 0;
        int outgoing = 0;
        boolean repeat = true;
        int repeatCounter = 0;
        if (repeat == true && repeatCounter < 3) {

            if (repeatCounter > 0) {
                JSHelpers.ScrollXPagesOnDynamicLoadingpage(2);
            }

            String xPath = "//nlb-transaction-card//nlb-amount/div/div[2]";
            List<WebElement> elements = SelectByXpath.CreateElementsByXpath(xPath);

            for (WebElement element : elements) {
                if (element.getAttribute("innerText").matches("^(?:0|[1-9]\\d{0,2}(?:\\.\\d{3})*),\\d{2}$")) {
                    incoming++;
                } else if (element.getAttribute("innerText").matches("^−(?:0|[1-9]\\d{0,2}(?:\\.\\d{3})*),\\d{2}$")) {
                    outgoing++;
                } else fail("Amount element has incorrect format");
            }
            if (incoming > 0 && outgoing > 0) {
                repeat = false;
            } else repeatCounter++;
        }
    }

    @And("Click on NLB button {string}")
    public void clickOnNLBButton(String buttonName) throws Throwable {
        String xPath = "//nlb-button/button/div[contains(text(), '" + buttonName + "')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Close amount filter")
    public void closeAmountFilter() throws Throwable {
        String xPathIcon = "//nlb-tag/div/div[2]/nlb-icon[@name='icon-close']";
        WebElement iconElement = SelectByXpath.CreateElementByXpath(xPathIcon);
        hp.ClickOnElement(iconElement);
    }

    @And("Assert Outgoing transactions is selected in Transaction type")
    public void assertOutgoingTransactionsIsSelectedInTransactionType() throws Throwable {
        String xPath = "//nlb-radio-button//input";
        List<WebElement> elements = SelectByXpath.CreateElementsByXpath(xPath);
        assertTrue(elements.get(2).isSelected());
    }

    @And("Assert there are only Outgoing transactions in transactions list")
    public void assertThereAreOnlyOutgoingTransactionsInTransactionsList() throws Throwable {
        String xPath = "//nlb-transaction-card//h5//nlb-amount/div/div[2]";
        List<WebElement> elements = SelectByXpath.CreateElementsByXpath(xPath);
        for (WebElement element : elements) {
            assertTrue(element.getAttribute("innerText").matches("^−(?:0|[1-9]\\d{0,2}(?:\\.\\d{3})*),\\d{2}$"));
        }
    }

    @And("Enter {string} to Amount filter {string}")
    public void enterToAmountFilter(String amount, String filterName) throws Throwable {
        String xPath = "//nlb-input-amount-currency//label[contains(text(), '" + filterName + "')]/following-sibling::div/input[@placeholder='0,00'][1]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        hp.EnterTextToElement(element, amount);
    }

    @And("Assert Amount filter field {string} has value {string}")
    public void assertAmountFilterFieldHasValue(String filterName, String expectedAmount) throws Throwable {
        String xPath = "//nlb-input-amount-currency//label[contains(text(), '" + filterName + "')]/following-sibling::div/input[@placeholder='0,00'][1]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertEquals(expectedAmount, element.getAttribute("value"));
    }

    @And("Assert transaction amounts after filter are between {double} and {double}")
    public void assertTransactionAmountsAfterFilterAreBetweenAnd(double lowerBound, double upperBound) throws Throwable {
        String xPath = "//nlb-transaction-card//h5//nlb-amount/div/div[2]";
        List<WebElement> elements = SelectByXpath.CreateElementsByXpath(xPath);

        boolean allInRange = true;

        for (WebElement element : elements) {
            try {
                String text = element.getAttribute("innerText").replace(",", ".").replace("−", "");
                double value = Double.parseDouble(text);

                // Check if the value is within the range
                if (value < lowerBound || value > upperBound) {
                    allInRange = false;
                    break;
                }
            } catch (NumberFormatException e) {
                // Handle the exception if conversion fails
                allInRange = false;
                break;
            }
        }
        assertTrue(allInRange);

    }

    @And("Assert that transaction amounts after filter disabling are not only between {double} and {double}")
    public void assertThatTransactionAmountsAfterFilterDisablingAreNotOnlyBetweenAnd(double lowerBound, double upperBound) throws Throwable {
        String xPath = "//nlb-transaction-card//h5//nlb-amount/div/div[2]";
        List<WebElement> elements = SelectByXpath.CreateElementsByXpath(xPath);

        boolean allInRange = true;

        for (WebElement element : elements) {
            try {
                String text = element.getAttribute("innerText").replace(",", ".").replace("−", "");
                double value = Double.parseDouble(text);

                // Check if the value is within the range
                if (value < lowerBound || value > upperBound) {
                    allInRange = false;
                    break;
                }
            } catch (NumberFormatException e) {
                // Handle the exception if conversion fails
                allInRange = false;
                break;
            }
        }
        assertFalse(allInRange);
    }

    @And("Assert NLB Validation error {string}")
    public void assertNLBValidationError(String error) throws Throwable {
        String xPath = "//nlb-validation-error//div[contains(text(), '" + error + "')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
    }

    @And("Assert button that has div with text {string} is not clickable")
    public void assertButtonThatHasDivWithTextIsNotClickable(String text) throws Throwable {
        String xPath = "//div[contains(text(), '" + text + "')]/ancestor::button";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertFalse(element.isEnabled());
        assertEquals("true", element.getAttribute("disabled"));
    }

    @And("Remember first few transaction purposes {string} and creditor names {string}")
    public void rememberFirstFewTransactionPurposesAndCreditorNames(String purposeKey, String creditorNameKey) throws Throwable {
        //transactions purposes
        String purposeXpath = "//nlb-transaction-card//div/div[2]//nlb-heading-text/h5";
        List<WebElement> purposeElements = SelectByXpath.CreateElementsByXpath(purposeXpath);
        List<String> purposes = new ArrayList<>();
        for (int i = 0; i < 5; i++) {
            purposes.add(purposeElements.get(i).getAttribute("innerText"));
        }
        DataManager.userObject.put(purposeKey, purposes);
        //creditor names
        String creditorxPath = "//nlb-transaction-card//div/div[2]//div[2]";
        List<WebElement> creditorElements = SelectByXpath.CreateElementsByXpath(creditorxPath);
        List<String> creditorNames = new ArrayList<>();
        for (int i = 0; i < 5; i++) {
            creditorNames.add(creditorElements.get(i).getAttribute("innerText"));
        }
        DataManager.userObject.put(creditorNameKey, creditorNames);
    }

    @And("Wait for element by tag {string} attribute {string} with value {string}")
    public void waitForElementByTagAttributeWithValue(String tag, String attribute, String value) throws InterruptedException {
        String xPath = "//" + tag + "[@" + attribute + "='" + value + "']";
        By element = SelectByXpath.CreateByElementByXpath(xPath);
        WaitHelpers.WaitForElement(element);
    }

    @And("Assert Search bar is displayed correctly in Transactions list")
    public void assertSearchBarIsDisplayedCorrectlyInTransactionsList() throws Throwable {
        //search bar icon
        String xPathIcon = "//input/ancestor::div[1]/preceding-sibling::nlb-icon/i[contains(@class, ' icon-search')]";
        WebElement iconElement = SelectByXpath.CreateElementByXpath(xPathIcon);
        assertTrue(iconElement.isDisplayed());
        //search input
        /*String xPathInput = "//input[@placeholder='Type to search, # for tags']";
        WebElement inputElement = SelectByXpath.CreateElementByXpath(xPathInput);
        assertTrue(inputElement.isDisplayed());
        assertTrue(inputElement.getAttribute("innerText").isEmpty());*/
        //cancel button
        String xPathCancel = "//input[@placeholder='Search...']//ancestor::div[3]/following-sibling::span";
        WebElement cancelElement = SelectByXpath.CreateElementByXpath(xPathCancel);
        assertTrue(cancelElement.isDisplayed());
        assertTrue(cancelElement.isEnabled());
        assertEquals("Cancel", cancelElement.getAttribute("innerText"));
    }

    @And("Assert transactions in Product details have Purpose {string}")
    public void assertTransactionsInProductDetailsHavePurpose(String expectedPurpose) throws Throwable {
        //transactions purposes
        String purposeXpath = "//nlb-transaction-card//div/div[2]//nlb-heading-text/h5[contains(@class,'tw-text-gray-100')]";
        List<WebElement> purposeElements = SelectByXpath.CreateElementsByXpath(purposeXpath);
        for (WebElement element : purposeElements) {
            assertEquals(expectedPurpose, element.getAttribute("innerText"));
        }
    }

    @And("Click on NLB icon close")
    public void clickOnNLBIconClose() throws Throwable {
        String xPath = "//nlb-icon/i[contains(@class, 'icon-close')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Assert transactions in Product details have Creditor name {string}")
    public void assertTransactionsInProductDetailsHaveCreditorName(String expectedCreditorName) throws Throwable {
        //creditor names
        String creditorxPath = "//nlb-transaction-card//div/div[2]//div[2]";
        List<WebElement> creditorElements = SelectByXpath.CreateElementsByXpath(creditorxPath);
        for (WebElement element : creditorElements) {
            assertEquals(expectedCreditorName, element.getAttribute("innerText"));
        }
    }

    @And("Assert transactions in Product details have BIC {string}")
    public void assertTransactionsInProductDetailsHaveBIC(String expectedBIC) throws Throwable {
        String xPath = "//nlb-transaction-card//nlb-icon";
        String xPathBIC = "(//div[text()='BIC'])[2]/following-sibling::div/div";
        List<WebElement> elements = SelectByXpath.CreateElementsByXpath(xPath);
        int size = elements.size();
        if (size > 5) {
            size = 5;
        }
        for (int i = 0; i < size; i++) {
            List<WebElement> downArrowEl = SelectByXpath.CreateElementsByXpath(xPath);
            hp.ClickOnElement(downArrowEl.get(i));
            WebElement bicElement = SelectByXpath.CreateElementByXpath(xPathBIC);
            assertEquals(expectedBIC, bicElement.getAttribute("innerText"));
            List<WebElement> upArrowEl = SelectByXpath.CreateElementsByXpath(xPath);
            hp.ClickOnElement(downArrowEl.get(i));
        }
    }

    @And("Assert transactions in Product details have Reference {string}")
    public void assertTransactionsInProductDetailsHaveReference(String expectedReference) throws Throwable {
        String xPath = "//nlb-transaction-card//nlb-icon";
        String xPathReference = "(//div[text()='Creditor reference'])[2]/following-sibling::div/div";
        List<WebElement> elements = SelectByXpath.CreateElementsByXpath(xPath);
        int size = elements.size();
        if (size > 5) {
            size = 5;
        }
        for (int i = 0; i < size; i++) {
            List<WebElement> downArrowEl = SelectByXpath.CreateElementsByXpath(xPath);
            hp.ClickOnElement(downArrowEl.get(i));
            WebElement referenceElement = SelectByXpath.CreateElementByXpath(xPathReference);
            assertEquals(expectedReference, referenceElement.getAttribute("innerText"));
        }
    }

    @And("Assert transactions in Product details have IBAN {string}")
    public void assertTransactionsInProductDetailsHaveIBAN(String expectedIBAN) throws Throwable {
        String xPath = "//nlb-transaction-card//nlb-icon";
        String xPathIban = "(//div[contains(text(),'Creditor IBAN')])[2]/following-sibling::div/nlb-iban";
        List<WebElement> elements = SelectByXpath.CreateElementsByXpath(xPath);
        int size = elements.size();
        if (size > 5) {
            size = 5;
        }
        for (int i = 0; i < size; i++) {
            List<WebElement> downArrowEl = SelectByXpath.CreateElementsByXpath(xPath);
            hp.ClickOnElement(downArrowEl.get(i));
            WebElement ibanElement = SelectByXpath.CreateElementByXpath(xPathIban);
            assertEquals(expectedIBAN, ibanElement.getAttribute("innerText").replace(" ", ""));
        }
    }

    @And("Assert first few transaction purposes and creditor names are from remembered lists by keys {string} and {string}")
    public void assertFirstFewTransactionPurposesAndCreditorNamesAreFromRememberedListsByKeysAnd(String purposeKey, String creditorKey) throws Throwable {
        List<String> expectedPurposes = DataManager.getListOfStringsFromMap(purposeKey);
        List<String> expectedCreditors = DataManager.getListOfStringsFromMap(creditorKey);


        //transactions purposes
        String purposeXpath = "//nlb-transaction-card//div/div[2]//nlb-heading-text/h5";
        List<WebElement> purposeElements = SelectByXpath.CreateElementsByXpath(purposeXpath);
        for (int i = 0; i < 5; i++) {
            assertEquals(expectedPurposes.get(i), purposeElements.get(i).getAttribute("innerText"));
        }
        //creditor names
        String creditorxPath = "//nlb-transaction-card//div/div[2]//div[2]";
        List<WebElement> creditorElements = SelectByXpath.CreateElementsByXpath(creditorxPath);
        for (int i = 0; i < 5; i++) {
            assertEquals(expectedCreditors.get(i), creditorElements.get(i).getAttribute("innerText"));
        }
    }

    @And("Assert Download transactions options are {string} and {string}")
    public void assertDownloadTransactionsOptionsAreAnd(String option1, String option2) throws Throwable {
        String xPath = "//div[@aria-label='Select option']/div";
        List<WebElement> elements = SelectByXpath.CreateElementsByXpath(xPath);
        assertFalse(elements.isEmpty());
        for (int i = 0; i < elements.size(); i++) {
            if (i == 0) {
                assertEquals(option1, elements.get(i).getAttribute("innerText"));
            } else if (i == 1) {
                assertEquals(option2, elements.get(i).getAttribute("innerText"));
            } else {
                fail("There are more than 2 options");
            }
        }
    }

    @And("Click on down arrow on first transaction do display details")
    public void clickOnDownArrowOnFirstTransactionDoDisplayDetails() throws Throwable {
        String xPath = "(//nlb-transaction-card//nlb-icon/i[contains(@class, 'icon-chevron-down')])[1]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Click on Get receipt button in Transaction details")
    public void clickOnGetReceiptButtonInTransactionDetails() throws Throwable {
        String xPath = "//nlb-link//*[text()='Confirmation']";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Assert document with name starting with {string} and has file type {string} is downloaded")
    public void assertDocumentWithNameStartingWithAndHasFileTypeIsDownloaded(String name, String fileType) {
        String path = DataManager.getDataFromHashDatamap("1", "pdf_download_path");
        assertTrue(Utilities.waitForDownloadAndCheckItByNameAndType(path, name, 30, 10, fileType));
    }

    @And("Assert element by tag {string} and attribute {string} with value {string}")
    public void assertElementByTagAndAttributeWithValue(String tag, String attribute, String value) throws Throwable {
        String xPath = "//" + tag + "[@" + attribute + "='" + value + "']";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
    }

    @And("Scroll to Product card with IBAN from Excel {string} columnName {string}")
    public void scrollToProductCardWithIBANFromExcelColumnName(String rowindex, String columnName) throws InterruptedException {
        String stringForProductIban = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPathForProductCard = "(//nlb-product-card//*[contains(text(),'" + stringForProductIban + "')]//ancestor::nlb-product-card//div)[1]";
        By elForProductIban = SelectByXpath.CreateByElementByXpath(xPathForProductCard);
        WaitHelpers.WaitForElement(elForProductIban);
        WebElement elementForProductIban = SelectByXpath.CreateElementBy(elForProductIban);
        JSHelpers.ScrollIntoViewBottom(elementForProductIban);
    }

    @And("Remember current and available balances for account from Excel {string} columnName {string} under keys {string} and {string} and assert {string} currency")
    public void rememberCurrentAndAvailableBalancesForAccountFromExcelColumnNameUnderKeysAndAndAssertCurrency(String rowindex, String columnName, String curr, String avai, String currency) throws Throwable {
        String iban = DataManager.getDataFromHashDatamap(rowindex, columnName);
        //current balance
        String xPath1 = "//div[contains(text(),'" + iban + "')]//ancestor::div[3]/div[2]//nlb-heading-text[2]//nlb-amount//span[1]";
        WebElement element1 = SelectByXpath.CreateElementByXpath(xPath1);
        DataManager.userObject.put(curr, element1.getAttribute("innerText"));
        //current balance currency
        String xPath2 = "//div[contains(text(),'" + iban + "')]//ancestor::div[3]/div[2]//nlb-heading-text[2]//nlb-amount//span[2]";
        WebElement element2 = SelectByXpath.CreateElementByXpath(xPath2);
        assertEquals(currency, element2.getAttribute("innerText"));
        //available balance
        String xPath3 = "//div[contains(text(),'" + iban + "')]//ancestor::div[3]/div[2]//nlb-heading-text[4]//nlb-amount//span[1]";
        WebElement element3 = SelectByXpath.CreateElementByXpath(xPath3);
        DataManager.userObject.put(avai, element3.getAttribute("innerText"));
        //current balance currency
        String xPath4 = "//div[contains(text(),'" + iban + "')]//ancestor::div[3]/div[2]//nlb-heading-text[4]//nlb-amount//span[2]";
        WebElement element4 = SelectByXpath.CreateElementByXpath(xPath4);
        assertEquals(currency, element4.getAttribute("innerText"));
    }

    @And("Assert current balance is the same as in balance under key {string}")
    public void assertCurrentBalanceIsTheSameAsInBalanceUnderKey(String key) throws Throwable {
        String expected = DataManager.userObject.get(key).toString();
        String xPath = "//*[@id=\"label-balance-EUR\"]/dd/nlb-amount/div/span[1]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertEquals(expected, element.getAttribute("innerText"));
    }

    @And("Assert available balance is the same as in balance under key {string}")
    public void assertAvailableBalanceIsTheSameAsInBalanceUnderKey(String key) throws Throwable {
        String expected = DataManager.userObject.get(key).toString();
        String xPath = "//*[@id=\"label-available-EUR\"]/dd/nlb-heading-text/div/nlb-amount/div/span[1]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertEquals(expected, element.getAttribute("innerText"));
    }

    @And("Select {string} tab in Products details")
    public void selectTabInProductsDetails(String tabName) throws Throwable {
        String xPath = "//nlb-tabs//a[contains(text(), '" + tabName + "')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Wait for element by tag {string} and text {string}")
    public void waitForElementByTagAndText(String tag, String text) throws InterruptedException {
        String xPath = "//" + tag + "[text()='" + text + "']";
        By element = SelectByXpath.CreateByElementByXpath(xPath);
        WaitHelpers.WaitForElement(element);
    }

    @And("Assert {string} tab in Products details is selected")
    public void assertTabInProductsDetailsIsSelected(String tabName) throws Throwable {
        String xPath = "//nlb-tabs//a[contains(@class, ' tw-text-primaryColor')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertEquals(tabName, element.getAttribute("innerText"));
    }

    @And("Assert Financial details in Loan details page is displayed with index {int}")
    public void assertFinancialDetailsInLoanDetailsPageIsDisplayedWithIndex(int index) throws Throwable {
        String xPath = "//nlb-selected-product-details//nlb-product-details-card["+index+"]//nlb-heading-text/h3[not(contains(@class,'xs:tw-hidden'))]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
        assertEquals("Financial details", element.getAttribute("innerText"));
    }

    @And("Assert Account details in Loan details page is displayed with index {int}")
    public void assertAccountDetailsInLoanDetailsPageIsDisplayedWithIndex(int index) throws Throwable {
        String xPath = "//nlb-selected-product-details//nlb-product-details-card["+index+"]//nlb-heading-text/h3[not(contains(@class,'xs:tw-hidden'))]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
        assertEquals("Account details", element.getAttribute("innerText"));
    }

    @And("Assert Documents archive link under Account details")
    public void assertDocumentsArchiveLinkUnderAccountDetails() throws Throwable {
        String xPath = "//*[contains(text(), 'Account details')]/ancestor::div[1]/following-sibling::div[1]/nlb-link/span[contains(text(), 'Document archive')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
    }

    @And("Assert Bundle services available in Product details is displayed with index {int}")
    public void assertBundleServicesAvailableInProductDetailsIsDisplayedWithIndex(int index) throws Throwable {
        String xPath = "//nlb-selected-product-details//nlb-product-details-card[" + index + "]//nlb-heading-text/h3";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
        assertEquals("Bundle services available", element.getAttribute("innerText"));
    }

    @And("Assert Overdraft is displayed correctly in Financial details for Current account")
    public void assertOverdraftIsDisplayedCorrectlyInFinancialDetailsForCurrentAccount() throws Throwable {
        String currentEnv = DataManager.getDataFromHashDatamap("1","currentEnv");
        if (currentEnv.equals("uat")){
            //overdraft title
            String titlexPath = "//h3[contains(text(), 'Financial details')]/ancestor::div[1]/following-sibling::dl[1]/div[1]/dt[1]/div";
            WebElement titleElement = SelectByXpath.CreateElementByXpath(titlexPath);
            assertTrue(titleElement.isDisplayed());
            assertEquals("Overdraft", titleElement.getAttribute("innerText"));
            //amount
            String amountxPath = "//h3[contains(text(), 'Financial details')]/ancestor::div[1]/following-sibling::dl[1]//dd[1]//nlb-amount//span[1]";
            WebElement amountElement = SelectByXpath.CreateElementByXpath(amountxPath);
            assertTrue(amountElement.isDisplayed());
            assertTrue(amountElement.getAttribute("innerText").matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{2}"));
            //currency
            String currencyxPath = "//h3[contains(text(), 'Financial details')]/ancestor::div[1]/following-sibling::dl[1]//dd[1]//nlb-amount//span[2]";
            WebElement currencyElement = SelectByXpath.CreateElementByXpath(currencyxPath);
            assertTrue(currencyElement.isDisplayed());
            assertEquals("EUR", currencyElement.getAttribute("innerText"));
        }
        if (currentEnv.equals("tst")){
            //overdraft title
            String titlexPath = "//h3[contains(text(), 'Financial details')]/ancestor::div[1]/following-sibling::dl[1]/div[1]/dt[1]/div";
            WebElement titleElement = SelectByXpath.CreateElementByXpath(titlexPath);
            assertTrue(titleElement.isDisplayed());
            assertEquals("Overdraft", titleElement.getAttribute("innerText"));
            //amount
            String amountxPath = "//h3[contains(text(), 'Financial details')]/ancestor::div[1]/following-sibling::dl[1]//dd[1]//nlb-amount//span[1]";
            WebElement amountElement = SelectByXpath.CreateElementByXpath(amountxPath);
            assertTrue(amountElement.isDisplayed());
            assertTrue(amountElement.getAttribute("innerText").matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{2}"));
            //currency
            String currencyxPath = "//h3[contains(text(), 'Financial details')]/ancestor::div[1]/following-sibling::dl[1]//dd[1]//nlb-amount//span[2]";
            WebElement currencyElement = SelectByXpath.CreateElementByXpath(currencyxPath);
            assertTrue(currencyElement.isDisplayed());
            assertEquals("EUR", currencyElement.getAttribute("innerText"));
        }
    }

    @And("Assert Overdraft expiration date is displayed correctly in Financial details for Current accounts")
    public void assertOverdraftExpirationDateIsDisplayedCorrectlyInFinancialDetailsForCurrentAccounts() throws Throwable {
        String currentEnv = DataManager.getDataFromHashDatamap("1","currentEnv");
        if (currentEnv.equals("uat")){
            //overdraft expiration date title
            String titlexPath = "//h3[contains(text(), 'Financial details')]/ancestor::div[1]/following-sibling::dl/div[2]/dt/div";
            WebElement titleElement = SelectByXpath.CreateElementByXpath(titlexPath);
            assertTrue(titleElement.isDisplayed());
            assertEquals("Overdraft expiration date", titleElement.getAttribute("innerText"));
            //oed value
            String oedxPath = "//h3[contains(text(), 'Financial details')]/ancestor::div[1]/following-sibling::dl/div[2]/dd/div";
            WebElement oedElement = SelectByXpath.CreateElementByXpath(oedxPath);
            assertTrue(oedElement.isDisplayed());
            assertTrue(oedElement.getAttribute("innerText").equals("until changed") || oedElement.getAttribute("innerText").matches("[0-9]{2}[.]{1}[0-9]{2}[.]{1}[0-9]{4}"));
        }
        if (currentEnv.equals("tst")){
            //overdraft expiration date title
            String titlexPath = "//h3[contains(text(), 'Financial details')]/ancestor::div[1]/following-sibling::dl/div[2]/dt/div";
            WebElement titleElement = SelectByXpath.CreateElementByXpath(titlexPath);
            assertTrue(titleElement.isDisplayed());
            assertEquals("Overdraft expiration date", titleElement.getAttribute("innerText"));
            //oed value
            String oedxPath = "//h3[contains(text(), 'Financial details')]/ancestor::div[1]/following-sibling::dl/div[2]/dd/div";
            WebElement oedElement = SelectByXpath.CreateElementByXpath(oedxPath);
            assertTrue(oedElement.isDisplayed());
            assertTrue(oedElement.getAttribute("innerText").equals("until changed") || oedElement.getAttribute("innerText").matches("[0-9]{2}[.]{1}[0-9]{2}[.]{1}[0-9]{4}"));
        }
    }

    @And("Assert Interest rate is displayed correctly in Financial details for Current account")
    public void assertInterestRateIsDisplayedCorrectlyInFinancialDetailsForCurrentAccount() throws Throwable {
        String currentEnv = DataManager.getDataFromHashDatamap("1","currentEnv");
        if (currentEnv.equals("uat")){
            //interest rate title
            String IRxPath = "//h3[contains(text(), 'Financial details')]/ancestor::div[1]/following-sibling::dl[1]/div[3]/dt/div";
            WebElement IRElement = SelectByXpath.CreateElementByXpath(IRxPath);
            assertTrue(IRElement.isDisplayed());
            assertEquals("Interest rate", IRElement.getAttribute("innerText"));
            //interest rate amount in %
            String amountxPath = "//h3[contains(text(), 'Financial details')]/ancestor::div[1]/following-sibling::dl[1]/div[3]/dd/div";
            WebElement amountElement = SelectByXpath.CreateElementByXpath(amountxPath);
            assertTrue(amountElement.isDisplayed());
            assertTrue(amountElement.getAttribute("innerText").matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{4}[%]{1}"));
        }
        if (currentEnv.equals("tst")){
            //interest rate title
            String IRxPath = "//h3[contains(text(), 'Financial details')]/ancestor::div[1]/following-sibling::dl[1]/div[3]/dt/div";
            WebElement IRElement = SelectByXpath.CreateElementByXpath(IRxPath);
            assertTrue(IRElement.isDisplayed());
            assertEquals("Interest rate", IRElement.getAttribute("innerText"));
            //interest rate amount in %
            String amountxPath = "//h3[contains(text(), 'Financial details')]/ancestor::div[1]/following-sibling::dl[1]/div[3]/dd/div";
            WebElement amountElement = SelectByXpath.CreateElementByXpath(amountxPath);
            assertTrue(amountElement.isDisplayed());
            assertTrue(amountElement.getAttribute("innerText").matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{4}[%]{1}"));
        }
    }

    @And("Assert Currency exchange link under Financial details")
    public void assertDocumentsArchiveLinkUnderFinancialDetails() throws Throwable {
        String xPath = "//h3[contains(text(), 'Financial details')]/ancestor::div[1]/following-sibling::div[1]/nlb-link/span[contains(text(), 'Currency exchange')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
    }

    @And("Assert {string} link under Financial details with index {string}")
    public void assertLinkUnderFinancialDetailsWithIndex(String linkName, String index) throws Throwable {
        String xpath = "(//h3[contains(text(), '" + linkName + "')]/ancestor::div[1]/following-sibling::div[2]/nlb-link/span)[" + index + "]";
        WebElement element = SelectByXpath.CreateElementByXpath(xpath);
        assertTrue(element.isDisplayed());
        assertTrue(JSHelpers.checkIfWebElementIsClickable(element));
    }

    @And("Assert Account type is displayed correctly in Account details for Gradual Savings account")
    public void assertAccountTypeIsDisplayedCorrectlyInAccountDetailsForGradualSavingsAccount() throws Throwable {
        //account type title
        String titlexPath = "//h3[contains(text(), 'Account details')]/ancestor::div[1]/following-sibling::dl[1]/div[1]/dt";
        WebElement titleElement = SelectByXpath.CreateElementByXpath(titlexPath);
        assertTrue(titleElement.isDisplayed());
        assertEquals("Account type", titleElement.getAttribute("innerText"));
        //account type value
        String ATxPath = "//h3[contains(text(), 'Account details')]/ancestor::div[1]/following-sibling::dl[1]/div[1]/dd/div";
        WebElement ATElement = SelectByXpath.CreateElementByXpath(ATxPath);
        assertTrue(ATElement.isDisplayed());
        assertEquals("Savings", ATElement.getAttribute("innerText"));
    }

    @And("Assert Purpose is displayed correctly in Account details for Gradual Savings account")
    public void assertPurposeIsDisplayedCorrectlyInAccountDetailsForGradualSavingsAccount() throws Throwable {
        //purpose title
        String titlexPath = "//h3[contains(text(), 'Account details')]/ancestor::div[1]/following-sibling::dl[1]/div[4]/dt[1]";
        WebElement titleElement = SelectByXpath.CreateElementByXpath(titlexPath);
        assertTrue(titleElement.isDisplayed());
        assertEquals("Purpose", titleElement.getAttribute("innerText"));
        //purpose value
        String purposexPath = "//h3[contains(text(), 'Account details')]/ancestor::div[1]/following-sibling::dl[1]/div[4]/dd/div";
        WebElement purposeElement = SelectByXpath.CreateElementByXpath(purposexPath);
        assertTrue(purposeElement.isDisplayed());
        String currentEnv = DataManager.getDataFromHashDatamap("1", "currentEnv");
        if (currentEnv.equals("tst")){
            assertEquals("TESTIRANJE ZA DBP", purposeElement.getAttribute("innerText"));
        } else {
            assertEquals("VARČEVANJE NBO", purposeElement.getAttribute("innerText"));
        }
    }

    @And("Assert Expiration date is displayed correctly in Account details for Gradual Savings account")
    public void assertExpirationDateIsDisplayedCorrectlyInAccountDetailsForGradualSavingsAccount() throws Throwable {
        //expiration date title
        String titlexPath = "//h3[contains(text(), 'Account details')]/ancestor::div[1]/following-sibling::dl[1]/div[6]/dt[1]";
        WebElement titleElement = SelectByXpath.CreateElementByXpath(titlexPath);
        assertTrue(titleElement.isDisplayed());
        assertEquals("Expiration date", titleElement.getAttribute("innerText"));
        //expiraiton date value
        String datexPath = "//h3[contains(text(), 'Account details')]/ancestor::div[1]/following-sibling::dl[1]/div[6]/dd/div";
        WebElement dateElement = SelectByXpath.CreateElementByXpath(datexPath);
        assertTrue(dateElement.isDisplayed());
        assertTrue(dateElement.getAttribute("innerText").matches("^(0[1-9]|[1-2][0-9]|3[01])\\.(0[1-9]|1[0-2])\\.\\d{4}$"));
    }

    @And("Assert Account owner in Account details is from Excel {string} columnName {string}")
    public void assertAccountOwnerInAccountDetailsIsFromExcelColumnName(String rowindex, String columnName) throws Throwable {
        String currentEnv = DataManager.getDataFromHashDatamap("1", "currentEnv");
        if (currentEnv.equals("uat")){
            String ownerName = DataManager.getDataFromHashDatamap(rowindex, columnName);
            String xPath = "//nlb-product-details-card[3]//div[text() = 'Account owner']/ancestor::dt[1]/following-sibling::dd/div";
            WebElement element = SelectByXpath.CreateElementByXpath(xPath);
            assertTrue(element.isDisplayed());
            assertTrue(element.getAttribute("innerText").contains(ownerName));
        }
        if (currentEnv.equals("tst")){
            String ownerName = DataManager.getDataFromHashDatamap(rowindex, columnName);
            String xPath = "//nlb-product-details-card[3]//div[text() = 'Account owner']/ancestor::dt[1]/following-sibling::dd/div";
            WebElement element = SelectByXpath.CreateElementByXpath(xPath);
            assertTrue(element.isDisplayed());
            assertTrue(element.getAttribute("innerText").contains(ownerName));
        }
    }

    @And("Assert Account number in Account details is from Excel {string} columnName {string}")
    public void assertAccountNumberInAccountDetailsIsFromExcelColumnName(String rowindex, String columnName) throws Throwable {
        String currentEnv = DataManager.getDataFromHashDatamap("1", "currentEnv");
        if (currentEnv.equals("uat")){
            String ownerName = DataManager.getDataFromHashDatamap(rowindex, columnName);
            String xPath = "//nlb-product-details-card[3]//div[text() = 'Account number']/ancestor::dt[1]/following-sibling::dd/div";
            WebElement element = SelectByXpath.CreateElementByXpath(xPath);
            assertTrue(element.isDisplayed());
            assertEquals(ownerName, element.getAttribute("innerText"));
        }
        if (currentEnv.equals("tst")){
            String ownerName = DataManager.getDataFromHashDatamap(rowindex, columnName);
            String xPath = "//nlb-product-details-card[3]//div[text() = 'Account number']/ancestor::dt[1]/following-sibling::dd/div";
            WebElement element = SelectByXpath.CreateElementByXpath(xPath);
            assertTrue(element.isDisplayed());
            assertEquals(ownerName, element.getAttribute("innerText"));
        }
    }

    @And("Assert Opening date is displayed correctly in Account details for Savings account")
    public void assertOpeningDateIsDisplayedCorrectlyInAccountDetailsForSavingsAccount() throws Throwable {
        //opening date title
        String titlexPath = "//h3[contains(text(), 'Account details')]/ancestor::div[1]/following-sibling::dl[1]/div[5]/dt";
        WebElement titleElement = SelectByXpath.CreateElementByXpath(titlexPath);
        assertTrue(titleElement.isDisplayed());
        assertEquals("Opening date", titleElement.getAttribute("innerText"));
        //opening date value
        String datexPath = "//h3[contains(text(), 'Account details')]/ancestor::div[1]/following-sibling::dl[1]/div[5]/dd/div";
        WebElement dateElement = SelectByXpath.CreateElementByXpath(datexPath);
        assertTrue(dateElement.isDisplayed());
        assertTrue(dateElement.getAttribute("innerText").matches("^(0[1-9]|[1-2][0-9]|3[01])\\.(0[1-9]|1[0-2])\\.\\d{4}$"));
    }

    @And("Scroll to element by xPath {string} and scroll {int} more screen")
    public void scrollToElementByXPathAndScrollMoreScreen(String xPath, int screens) throws Throwable {
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        JSHelpers.ScrollIntoViewBottom(element);
        JSHelpers.scrollScreenDown(1);

    }

    @And("Assert either element with xPath {string} or element with xpath {string} is displayed")
    public void assertEitherElementWithXPathOrElementWithXpathIsDisplayed(String xPath1, String xPath2) {
        boolean isElement1Displayed = false;
        boolean isElement2Displayed = false;
        WebDriverWait wait = new WebDriverWait(driver, 2); // 3 seconds timeout

        try {
            WebElement element1 = wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath(xPath1)));
            isElement1Displayed = element1.isDisplayed();
        } catch (NoSuchElementException | TimeoutException e) {
            // Element 1 is not found or not visible within timeout
        }

        try {
            WebElement element2 = wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath(xPath2)));
            isElement2Displayed = element2.isDisplayed();
        } catch (NoSuchElementException | TimeoutException e) {
            // Element 2 is not found or not visible within timeout
        }

        assertTrue(isElement1Displayed || isElement2Displayed);

    }

    @And("Assert Statements filter label is {string}")
    public void assertStatementsFilterLabelIs(String expected) throws Throwable {
        String xPath = "//nlb-dropdown-select//label";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
        assertEquals(expected, element.getAttribute("innerText"));
    }

    @And("Assert Statements filter has year {string} selected")
    public void assertStatementsFilterHasYearSelected(String expected) throws Throwable {
        String xPath = "//nlb-dropdown-select//input";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertEquals(expected, element.getAttribute("value"));
    }

    @And("Assert first statement in Statement list")
    public void assertFirstStatementInStatementList() throws Throwable {
        String xPath = "//nlb-statement-item";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
    }

    @And("Select year {string} in Statements filter and assert there are {int} options")
    public void selectYearInStatementsFilterAndAssertThereAreOptions(String year, int optionAmt) throws Throwable {
        //Icon for dropdown menu
        String xPathIcon = "//nlb-dropdown-select//i";
        WebElement elementIcon = SelectByXpath.CreateElementByXpath(xPathIcon);
        hp.ClickOnElement(elementIcon);
        //dropdown menu, 10 elements
        String xPathMenu = "//div[contains(@class, 'tw-max-h-dropdownList')]/div";
        List<WebElement> elementsMenu = SelectByXpath.CreateElementsByXpath(xPathMenu);
        assertEquals(optionAmt, elementsMenu.size());
        List<String> expectedYearList = rh.getXYearsInPast(10);
        for (int i = 0; i < elementsMenu.size(); i++) {
            assertEquals(expectedYearList.get(i), elementsMenu.get(i).getAttribute("innerText"));
        }
        //dropdown menu single element
        String xPathYear = "//div[contains(@class, 'tw-max-h-dropdownList')]/div[contains(text(), '" + year + "')]";
        WebElement elementYear = SelectByXpath.CreateElementByXpath(xPathYear);
        hp.ClickOnElement(elementYear);
    }

    @And("Click download on first statement in Statement list")
    public void clickDownloadOnFirstStatementInStatementList() throws Throwable {
        String xPath = "//nlb-statement-item//nlb-icon[@name='icon-download']";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Click on button with tag {string} containing class {string}")
    public void clickOnButtonWithTagContainingClass(String tag, String className) throws Throwable {
        String xPath = "//" + tag + "[contains(@class, '" + className + "')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Assert first statement in Statement list is from year {string}")
    public void assertFirstStatementInStatementListIsFromYear(String expectedYear) throws Throwable {
        String xPath = "(//nlb-statement-item/div/div/div[2]/div[1])[1]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.getAttribute("innerText").startsWith(expectedYear));
    }

    @And("Assert statements in Statement list are displayed correctly")
    public void assertStatementsInStatementListAreDisplayedCorrectly() throws Throwable {
        //icons
        String xPathIcon = "//nlb-statement-item/div/div/div[1]/nlb-icon[@name='icon-statement']";
        List<WebElement> elementsIcon = SelectByXpath.CreateElementsByXpath(xPathIcon);
        for (WebElement element : elementsIcon) {
            assertTrue(element.isDisplayed());
        }
        //date
        String xPathDate = "//nlb-statement-item/div/div/div[2]/div[1]";
        List<WebElement> elementsDate = SelectByXpath.CreateElementsByXpath(xPathDate);
        for (WebElement element : elementsDate) {
            assertTrue(element.isDisplayed());
            assertTrue(element.getAttribute("innerText").matches("\\d{4}-\\d{2}-\\d{2}"));
        }
        //description
        String xPathDesc = "//nlb-statement-item/div/div/div[2]/div[2]";
        List<WebElement> elementsDesc = SelectByXpath.CreateElementsByXpath(xPathDesc);
        for (WebElement element : elementsDesc) {
            assertTrue(element.isDisplayed());
        }
        //download icon
        String xPathDownload = "//nlb-statement-item/div/div[2]/div/nlb-icon[@name='icon-download']";
        List<WebElement> elementsDownload = SelectByXpath.CreateElementsByXpath(xPathDownload);
        for (WebElement element : elementsDownload) {
            assertTrue(element.isDisplayed());
        }
    }

    @And("Assert Select date range title in Date filter")
    public void assertSelectDateRangeTitleInDateFilter() throws Throwable {
        String xPath = "//h3[text()='Select date range']/ancestor::nlb-heading-text";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
    }

    @And("Assert window behind Date filter popup is blurred")
    public void assertWindowBehindDateFilterPopupIsBlurred() throws Throwable {
        String xPath = "//nlb-date-filter-modal/nlb-modal/div[contains(@class, 'tw-backdrop-blur-sm')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
    }

    @And("Assert three showed months are correctly displayed")
    public void assertThreeShowedMonthsAreCorrectlyDisplayed() throws Throwable {
        //months amount
        String xPathAmount = "//div[contains(@class, 'ngb-dp-months')]/div";
        List<WebElement> amountElements = SelectByXpath.CreateElementsByXpath(xPathAmount);
        assertEquals(3, amountElements.size());
        //months titles in header
        String xPathHeader = "//ngb-datepicker-navigation//div[contains(@class, 'ngb-dp-month-name')]";
        List<WebElement> headerElements = SelectByXpath.CreateElementsByXpath(xPathHeader);
        assertTrue(RoutineHelper.assertThreeMonthsInDateFilterAreCorrectlySorted(headerElements));
        //week number per month
        for (int i = 1; i <= 3; i++) {
            List<WebElement> weekElements = SelectByXpath.CreateElementsByXpath("(//ngb-datepicker-month)[" + i + "]/div[@class = 'ngb-dp-week ng-star-inserted']");
            assertEquals(5, weekElements.size());
        }

        //getting all days in order
        List<String> daysOfWeekDates = new ArrayList<>();
        for (int i = 1; i <= 2; i++) {
            for (int j = 1; j <= 5; j++) {
                List<WebElement> weekDaysElements = SelectByXpath.CreateElementsByXpath("(//ngb-datepicker-month)[" + i + "]/div[@class = 'ngb-dp-week ng-star-inserted'][" + j + "]/div[@class='ngb-dp-day ng-star-inserted']");
                assertTrue(weekDaysElements.size() >= 1 && weekDaysElements.size() <= 7);
                for (WebElement element : weekDaysElements) {
                    daysOfWeekDates.add(element.getAttribute("aria-label"));
                }
            }
        }
        //same thing but for third month
        for (int i = 1; i <= 5; i++) {
            List<WebElement> weekDaysElements = SelectByXpath.CreateElementsByXpath("(//ngb-datepicker-month)[3]/div[@class = 'ngb-dp-week ng-star-inserted'][" + i + "]/div[@class='ngb-dp-day disabled ng-star-inserted']");
            assertTrue(weekDaysElements.size() >= 1 && weekDaysElements.size() <= 7);
            for (WebElement element : weekDaysElements) {
                daysOfWeekDates.add(element.getAttribute("aria-label"));
            }
        }
        //transforming saved dates to  better format for sorting
        Map<String, Integer> map = RoutineHelper.createMonthMap();
        List<LocalDate> dates = new ArrayList<>();
        for (String dayOfWeekDate : daysOfWeekDates) {
            String[] parts = dayOfWeekDate.split(", ")[1].split(" ");
            int day = Integer.parseInt(parts[0].replace(".", ""));
            int month = map.get(parts[1].toLowerCase());
            int year = Integer.parseInt(parts[2]);
            dates.add(LocalDate.of(year, month, day));
        }
        //check if those dates are sorted
        boolean isSorted = true;
        for (int i = 1; i < dates.size(); i++) {
            if (dates.get(i).isBefore(dates.get(i - 1))) {
                isSorted = false;
                break;
            }
        }
        assertTrue(isSorted);
        //check if all dates are present for all 3 months
        WebElement todayDateElement = SelectByXpath.CreateElementByXpath("//div[contains(@class, 'ngb-dp-today')]");
        String[] parts = todayDateElement.getAttribute("aria-label").split(", ")[1].split(" ");
        int day = Integer.parseInt(parts[0].replace(".", ""));
        int month = map.get(parts[1].toLowerCase());
        int year = Integer.parseInt(parts[2]);
        dates.add(LocalDate.of(year, month, day));


        boolean allDaysPresent = true;
        Map<YearMonth, List<LocalDate>> monthToDateMap = new HashMap<>();
        for (LocalDate date : dates) {
            YearMonth yearMonth = YearMonth.from(date);
            monthToDateMap.putIfAbsent(yearMonth, new ArrayList<>());
            monthToDateMap.get(yearMonth).add(date);
        }

        for (Map.Entry<YearMonth, List<LocalDate>> entry : monthToDateMap.entrySet()) {
            YearMonth yearMonth = entry.getKey();
            List<LocalDate> monthDates = entry.getValue();
            int daysInMonth = yearMonth.lengthOfMonth();
            if (monthDates.size() != daysInMonth) {
                allDaysPresent = false;
                System.out.println("Missing days in month: " + yearMonth);
                break;
            }
        }
        assertTrue(allDaysPresent);

    }

    @And("Assert tag icon in transaction details")
    public void assertTagIconInTransactionDetails() throws Throwable {
        String xPath = "//nlb-tags-add-remove//nlb-icon[@name='icon-tag']";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
    }

    @And("Assert Add tag link in transaction details")
    public void assertAddTagLinkInTransactionDetails() throws Throwable {
        String xPath = "//nlb-tags-add-remove//nlb-link";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
        assertEquals("Add tag", element.getAttribute("innerText"));
    }

    @And("Assert Tag input field is displayed correctly")
    public void assertTagInputFieldIsDisplayedCorrectly() throws Throwable {
        //whole element
        String xPath1 = "//nlb-tags-add-remove//nlb-search-box";
        WebElement element1 = SelectByXpath.CreateElementByXpath(xPath1);
        assertTrue(element1.isDisplayed());
        //hashtag icon in input field
        String xPath2 = "//nlb-tags-add-remove//nlb-search-box//i[contains(@class, 'icon-hash')]";
        WebElement element2 = SelectByXpath.CreateElementByXpath(xPath2);
        assertTrue(element2.isDisplayed());
        //input field
        String xPath3 = "//nlb-tags-add-remove//nlb-search-box//input[@placeholder='Create tag']";
        WebElement element3 = SelectByXpath.CreateElementByXpath(xPath3);
        assertTrue(element3.isDisplayed());
        //existing tags in dropdown list
        String xPath4 = "//nlb-tags-add-remove//nlb-search-box//ul/li";
        List<WebElement> elements = SelectByXpath.CreateElementsByXpath(xPath4);
        for (WebElement element : elements) {
            assertTrue(element.isDisplayed());
        }
    }

    @And("Assert Confirm button in Add tag")
    public void assertConfirmButtonInAddTag() throws Throwable {
        String xPath = "//nlb-tags-add-remove//nlb-link[contains(@class, 'bold')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
        assertEquals("Confirm", element.getAttribute("innerText"));
        JSHelpers.checkIfWebElementIsClickable(element);
    }

    @And("Assert Cancel button in Add tag and click")
    public void assertCancelButtonInAddTagAndClick() throws Throwable {
        String xPath = "//nlb-tags-add-remove//nlb-link/following-sibling::div";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
        assertEquals("Cancel", element.getAttribute("innerText"));
        hp.ClickOnElement(element);
    }

    @And("Assert Tag title after Add tag is clicked")
    public void assertTagTitleAfterAddTagIsClicked() throws Throwable {
        String xPath = "//nlb-tags-add-remove/dl/dt[contains(@class, 'subheadline')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
    }

    @And("Assert tag {string} is displayed correctly in transaction details")
    public void assertTagIsDisplayedCorrectlyInTransactionDetails(String tagName) throws Throwable {
        String xPath1 = "//nlb-tag/div/div[text() = '#" + tagName + "']";
        By element = SelectByXpath.CreateByElementByXpath(xPath1);
        WaitHelpers.WaitForElement(element);
        //tag name
        WebElement element1 = SelectByXpath.CreateElementByXpath(xPath1);
        assertTrue(element1.isDisplayed());
        //x option on tag
        String xPath2 = "//nlb-tag/div/div[text() = '#" + tagName + "']/following-sibling::div/nlb-icon[@name='icon-close']";
        WebElement element2 = SelectByXpath.CreateElementByXpath(xPath2);
        assertTrue(element2.isDisplayed());
    }

    @And("Scroll to element by xPath {string}")
    public void scrollToElementByXPath(String xPath) throws Throwable {
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        JSHelpers.ScrollIntoViewBottom(element);
    }

    @And("Click on remove button on tag {string}")
    public void clickOnRemoveButtonOnTag(String tagName) throws Throwable {
        //x option on tag
        String xPath = "//nlb-tag/div/div[text() = '#" + tagName + "']/following-sibling::div/nlb-icon[@name='icon-close']";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
        hp.ClickOnElement(element);
        WaitHelpers.waitForSeconds(2);
    }

    @And("Assert there is no tag {string} displayed")
    public void assertThereIsNoTagDisplayed(String tagName) throws Throwable {
        String xPath = "//nlb-tag/div/div[text() = '#" + tagName + "']";
        By el = By.xpath(xPath);
        boolean messageExists = ActionApiHelpers.isElementDisplayedCustomWithWaitToDisappear(el, 10, 2000);
        assertFalse(messageExists);
    }

    @And("Assert Product IBAN in Product details for Gradual savings is from Excel {string} columnName {string}")
    public void assertProductIBANInProductDetailsForGradualSavingsIsFromExcelColumnName(String rowindex, String columnName) throws Throwable {
        String accName = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPath = "//nlb-product-detail-header//nlb-heading-text/following-sibling::div[contains(@class, 'callout')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertEquals(accName, element.getAttribute("innerText"));
        assertTrue(element.isDisplayed());
    }

    @And("Assert Sum balance in Financial instruments header is displayed correctly")
    public void assertSumBalanceInFinancialInstrumentsHeaderIsDisplayedCorrectly() throws Throwable {
        //title
        String xPath1 = "(//nlb-heading-text[1]/h5)[1]";
        WebElement element1 = SelectByXpath.CreateElementByXpath(xPath1);
        assertTrue(element1.isDisplayed());
        assertEquals("Sum balance", element1.getAttribute("innerText"));
        //amount
        String xPath2 = "//h5[contains(text(), 'Sum balance')]/ancestor::nlb-heading-text/following-sibling::nlb-heading-text//nlb-amount//span[1]";
        WebElement element2 = SelectByXpath.CreateElementByXpath(xPath2);
        assertTrue(element2.isDisplayed());
        assertTrue(element2.getAttribute("innerText").matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{2}"));
        //currency
        String xPath3 = "//h5[contains(text(), 'Sum balance')]/ancestor::nlb-heading-text/following-sibling::nlb-heading-text//nlb-amount//span[2]";
        WebElement element3 = SelectByXpath.CreateElementByXpath(xPath3);
        assertTrue(element3.isDisplayed());
        assertEquals("EUR", element3.getAttribute("innerText"));

    }

    @And("Assert Cash in Financial instruments header is displayed correctly")
    public void assertCashInFinancialInstrumentsHeaderIsDisplayedCorrectly() throws Throwable {
        //title
        String xPath1 = "(//nlb-heading-text[1]/h5)[2]";
        WebElement element1 = SelectByXpath.CreateElementByXpath(xPath1);
        assertTrue(element1.isDisplayed());
        assertEquals("Cash", element1.getAttribute("innerText"));
        //amount
        String xPath2 = "//h5[contains(text(), 'Cash')]/ancestor::nlb-heading-text/following-sibling::nlb-heading-text//nlb-amount//span[1]";
        WebElement element2 = SelectByXpath.CreateElementByXpath(xPath2);
        assertTrue(element2.isDisplayed());
        assertTrue(element2.getAttribute("innerText").matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{2}"));
        //currency
        String xPath3 = "//h5[contains(text(), 'Cash')]/ancestor::nlb-heading-text/following-sibling::nlb-heading-text//nlb-amount//span[2]";
        WebElement element3 = SelectByXpath.CreateElementByXpath(xPath3);
        assertTrue(element3.isDisplayed());
        assertEquals("EUR", element3.getAttribute("innerText"));
    }

    @And("Assert {string} category in Product details is displayed with index {int}")
    public void assertCategoryInProductDetailsIsDisplayedWithIndex(String categoryName, int index) throws Throwable {
        String xPath = "(//nlb-selected-product-details//nlb-product-details-card["+index+"]//nlb-heading-text/h3)[2]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertEquals(categoryName, element.getAttribute("innerText"));
        assertTrue(element.isDisplayed());
    }

    @And("Assert Recipient name and address in Contact data is from Excel {string} columnName {string}")
    public void assertRecipientNameAndAddressInContactDataIsFromExcelColumnName(String rowindex, String columnName) throws Throwable {
        String expected = DataManager.getDataFromHashDatamap(rowindex, columnName);
        // TST
        //String xPath = "//h3[text() = 'Contact data']/ancestor::div[1]/following-sibling::div//div[text() = 'Recipient address']/ancestor::div[1]/following-sibling::div";
        //UAT
        String xPath = "//h3[text() = 'Recipient details']/ancestor::div[1]/following-sibling::div//div[text() = 'Address']/ancestor::div[1]/following-sibling::div";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
        assertEquals(expected, element.getAttribute("textContent"));
    }

    @And("Assert Country in Contact data is {string} in Financial instruments")
    public void assertCountryInContactDataIsInFinancialInstruments(String expected) throws Throwable {
        String xPath = "//h3[text() = 'Recipient details']/ancestor::div[1]/following-sibling::div//div[text() = 'Country']/ancestor::div[1]/following-sibling::div";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
        assertEquals(expected, element.getAttribute("innerText"));
    }

    @And("Assert Email in Contact data is from Excel {string} columnName {string}")
    public void assertEmailInContactDataIsFromExcelColumnName(String rowindex, String columnName) throws Throwable {
        String expected = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPath = "//h3[text() = 'Recipient details']/ancestor::div[1]/following-sibling::div//div[text() = 'E-mail']/ancestor::div[1]/following-sibling::div";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
        assertEquals(expected, element.getAttribute("innerText"));
    }

    @And("Assert Account number in Account details is from Excel {string} columnName {string} not IBAN")
    public void assertAccountNumberInAccountDetailsIsFromExcelColumnNameNotIBAN(String rowindex, String columnName) throws Throwable {
        String ownerName = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPath = "//h3[text() = 'Account details']/ancestor::div[1]/following-sibling::div//div[text() = 'Account number']/ancestor::div[1]/following-sibling::div";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
        assertEquals(ownerName, element.getAttribute("innerText"));
    }

    @And("Assert Opening date is dispalyed correctly in Account details for Financial instruments")
    public void assertOpeningDateIsDispalyedCorrectlyInAccountDetailsForFinancialInstruments() throws Throwable {
        //opening date title
        String titlexPath = "//h3[contains(text(), 'Account details')]/ancestor::div[1]/following-sibling::div[1]/div[3]/div[1]";
        WebElement titleElement = SelectByXpath.CreateElementByXpath(titlexPath);
        assertTrue(titleElement.isDisplayed());
        assertEquals("Opening date", titleElement.getAttribute("innerText"));
        //opening date value
        String datexPath = "//h3[contains(text(), 'Account details')]/ancestor::div[1]/following-sibling::div[1]/div[3]/div[2]/div";
        WebElement dateElement = SelectByXpath.CreateElementByXpath(datexPath);
        assertTrue(dateElement.isDisplayed());
        assertTrue(dateElement.getAttribute("innerText").matches("^(0[1-9]|[1-2][0-9]|3[01])\\.(0[1-9]|1[0-2])\\.\\d{4}$"));
    }

    @And("Assert Web application for financial instruments text is displayed correctly")
    public void assertWebApplicationForFinancialInstrumentsTextIsDisplayedCorrectly() throws Throwable {
        String xPath = "//h3[contains(text(), 'NLB web application for financial instruments')]//ancestor::div[1]/following-sibling::div//div[contains(@class, 'subheadline')]/div";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
        assertEquals("For additional features like portfolio review, buy/sell orders, advance payments see our financial instruments app - NLB Trading", element.getAttribute("innerText"));
    }

    @And("Assert NLB Trading link under NLB Web application for financial instruments")
    public void assertNLBTradingLinkUnderNLBWebApplicationForFinancialInstruments() throws Throwable {
        String xPath = "//h3[contains(text(), 'NLB web application for financial instruments')]/ancestor::div[1]/following-sibling::div[2]/nlb-link/span[contains(text(), 'NLB Trading')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
    }

    @And("Assert Sum balance value is from key {string}")
    public void assertSumBalanceValueIsFromKey(String key) throws Throwable {
        String expected = DataManager.userObject.get(key).toString();
        String xPath = "//h5[contains(text(), 'Sum balance')]/ancestor::nlb-heading-text/following-sibling::nlb-heading-text//nlb-amount//span[1]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertEquals(expected, element.getAttribute("innerText"));
    }

    @And("Assert Cash in Financial instruments is from key {string}")
    public void assertCashInFinancialInstrumentsIsFromKey(String key) throws Throwable {
        String expected = DataManager.userObject.get(key).toString();
        String xPath = "//h5[contains(text(), 'Cash')]/ancestor::nlb-heading-text/following-sibling::nlb-heading-text//nlb-amount//span[1]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertEquals(expected, element.getAttribute("innerText"));
    }

    @And("Assert tabs in Product details are displayed correctly")
    public void assertTabsInProductDetailsAreDisplayedCorrectly() throws Throwable {
        String xPath = "//nlb-tabs//a";
        List<WebElement> tabsElements = SelectByXpath.CreateElementsByXpath(xPath);
        int numOfTabs = tabsElements.size();
        for (int i = 0; i < numOfTabs; i++) {
            if (i == 0) {
                assertEquals("Transactions", tabsElements.get(i).getAttribute("innerText"));
            } else if (i == 1) {
                assertEquals("Statements", tabsElements.get(i).getAttribute("innerText"));
            } else if (i == 2) {
                assertEquals("Details", tabsElements.get(i).getAttribute("innerText"));
            } else {
                fail("More than 3 tabs are found");
            }
        }

        String defaultSelectedxPath = "//nlb-tabs//a[contains(@class, ' tw-text-primaryColor')]";
        WebElement defaultSelectedElement = SelectByXpath.CreateElementByXpath(defaultSelectedxPath);
        assertEquals("Transactions", defaultSelectedElement.getAttribute("innerText"));
    }

    @And("Assert Current balance in Gradual Savings Products Details")
    public void assertCurrentBalanceInGradualSavingsProductsDetails() throws Throwable {
        //booked balance title
        String titlexPath = "//nlb-heading-text/div[contains(text(), 'Current balance')]";
        WebElement titleElement = SelectByXpath.CreateElementByXpath(titlexPath);
        assertTrue(titleElement.isDisplayed());
        //amount
        String amountxPath = "//div[contains(text(), 'Current balance')]/ancestor::nlb-heading-text/following-sibling::nlb-heading-text//nlb-amount//span[1]";
        WebElement amountElement = SelectByXpath.CreateElementByXpath(amountxPath);
        assertTrue(amountElement.isDisplayed());
        assertTrue(amountElement.getAttribute("innerText").matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{2}"));
        //currency
        String currencyxPath = "//div[contains(text(), 'Current balance')]/ancestor::nlb-heading-text/following-sibling::nlb-heading-text//nlb-amount//span[2]";
        WebElement currencyElement = SelectByXpath.CreateElementByXpath(currencyxPath);
        assertTrue(currencyElement.isDisplayed());
        assertEquals("EUR", currencyElement.getAttribute("innerText"));
    }

    @And("Assert selected tab in Products details is {string}")
    public void assertSelectedTabInProductsDetailsIs(String tabName) throws Throwable {
        String defaultSelectedxPath = "//nlb-tabs//a[contains(@class, ' tw-text-primaryColor')]";
        WebElement defaultSelectedElement = SelectByXpath.CreateElementByXpath(defaultSelectedxPath);
        assertEquals(tabName, defaultSelectedElement.getAttribute("innerText"));
    }

    @And("Assert Interest rate is displayed correctly in Financial details for Savings account")
    public void assertInterestRateIsDisplayedCorrectlyInFinancialDetailsForSavingsAccount() throws Throwable {
        //interest rate title
        String IRxPath = "//h3[contains(text(), 'Financial details')]/ancestor::div[1]/following-sibling::dl[1]/div[1]/dt[1]";
        WebElement IRElement = SelectByXpath.CreateElementByXpath(IRxPath);
        assertTrue(IRElement.isDisplayed());
        assertEquals("Interest rate", IRElement.getAttribute("innerText"));
        //interest rate amount in %
        String amountxPath = "//h3[contains(text(), 'Financial details')]/ancestor::div[1]/following-sibling::dl[1]/div[1]/dd/div";
        WebElement amountElement = SelectByXpath.CreateElementByXpath(amountxPath);
        assertTrue(amountElement.isDisplayed());
        assertTrue(amountElement.getAttribute("innerText").matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{4}[%]{1}"));
    }

    @And("Assert Accrued interest is displayed correctly in Financial details for Savings account")
    public void assertAccruedInterestIsDisplayedCorrectlyInFinancialDetailsForSavingsAccount() throws Throwable {
        //accrued interest title
        String IRxPath = "//h3[contains(text(), 'Financial details')]/ancestor::div[1]/following-sibling::dl[1]/div[2]/dt[1]";
        WebElement IRElement = SelectByXpath.CreateElementByXpath(IRxPath);
        assertTrue(IRElement.isDisplayed());
        assertEquals("Accrued interest", IRElement.getAttribute("innerText"));
        //amount
        String amountxPath = "//h3[contains(text(), 'Financial details')]/ancestor::div[1]/following-sibling::dl[1]/div[2]//nlb-amount//span[1]";
        WebElement amountElement = SelectByXpath.CreateElementByXpath(amountxPath);
        assertTrue(amountElement.isDisplayed());
        assertTrue(amountElement.getAttribute("innerText").matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{2}"));
        //currency
        String currencyxPath = "//h3[contains(text(), 'Financial details')]/ancestor::div[1]/following-sibling::dl[1]/div[2]//nlb-amount//span[2]";
        WebElement currencyElement = SelectByXpath.CreateElementByXpath(currencyxPath);
        assertTrue(currencyElement.isDisplayed());
        assertEquals("EUR", currencyElement.getAttribute("innerText"));
    }

    @And("Assert that product card of name {string} and IBAN {string} from Excel {string} for Loan are shown correctly")
    public void assertThatProductCardOfNameAndIBANFromExcelForLoanAreShownCorrectly(String columnName1, String columnName2, String rowindex) throws Throwable {
        String productName = DataManager.getDataFromHashDatamap(rowindex, columnName1);
        String productIban = DataManager.getDataFromHashDatamap(rowindex, columnName2);
        String xPathForProductCard1 = "//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//*[contains(text(),'Remaining debt')]";
        String xPathForRemainingDebt = "(//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//nlb-heading-text//span[1])[1]";
        String xPathForRemainingDebtCurrency = "(//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//nlb-heading-text//span[2])[1]";
        String xPathIcon = "//div[contains(text(), '" + productIban + "')]/preceding-sibling::div//img";

        WebElement elementForProductCard1 = SelectByXpath.CreateElementByXpath(xPathForProductCard1);
        assertTrue(elementForProductCard1.isDisplayed());
        WebElement elementForRemainingDebt = SelectByXpath.CreateElementByXpath(xPathForRemainingDebt);
        String stringRemainingDebt = elementForRemainingDebt.getAttribute("innerText");
        assertTrue(stringRemainingDebt.matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{2}"));
        WebElement elementForRemainingDebtCurrency = SelectByXpath.CreateElementByXpath(xPathForRemainingDebtCurrency);
        String stringRemainingDebtCurrency = elementForRemainingDebtCurrency.getAttribute("innerText");
        assertTrue(stringRemainingDebtCurrency.contains("EUR"));
        WebElement iconElement = SelectByXpath.CreateElementByXpath(xPathIcon);
        assertTrue(iconElement.isDisplayed());
        assertEquals("https://test.dbp.nlb.si/web-retail/assets/img/product-icon/Loan-Icon.svg", iconElement.getAttribute("src"));
    }

    @And("Assert remaining debt is displayed correctly for Loan details")
    public void assertRemainingDebtIsDisplayedCorrectlyForLoanDetails() throws Throwable {
        //amount
        String amountxPath = "//nlb-heading-text//nlb-amount//span[1]";
        WebElement amountElement = SelectByXpath.CreateElementByXpath(amountxPath);
        assertTrue(amountElement.isDisplayed());
        assertTrue(amountElement.getAttribute("innerText").matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{2}"));
        // currency
        String currencyxPath = "//nlb-heading-text//nlb-amount//span[2]";
        WebElement currencyElement = SelectByXpath.CreateElementByXpath(currencyxPath);
        assertTrue(currencyElement.isDisplayed());
        assertEquals("EUR", currencyElement.getAttribute("innerText"));
        //remaining debt
        String remDebtxPath = "//nlb-heading-text/h5[contains(text(), 'Remaining debt')]";
        WebElement remDebtElement = SelectByXpath.CreateElementByXpath(remDebtxPath);
        assertTrue(remDebtElement.isDisplayed());
    }

    @And("Assert Amount is displayed correctly in Financial details for Loan")
    public void assertAmountIsDisplayedCorrectlyInFinancialDetailsForLoan() throws Throwable {
        //amount title
        String amountTitlexPath = "//h3[contains(text(), 'Financial details')]/ancestor::div[1]/following-sibling::div[1]/div[1]/div[1]";
        WebElement amountTitleElement = SelectByXpath.CreateElementByXpath(amountTitlexPath);
        assertTrue(amountTitleElement.isDisplayed());
        assertEquals("Amount", amountTitleElement.getAttribute("innerText"));
        //amount
        String amountxPath = "//h3[contains(text(), 'Financial details')]/ancestor::div[1]/following-sibling::div[1]/div[1]//nlb-amount//span[1]";
        WebElement amountElement = SelectByXpath.CreateElementByXpath(amountxPath);
        assertTrue(amountElement.isDisplayed());
        assertTrue(amountElement.getAttribute("innerText").matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{2}"));
        //currency
        String currencyxPath = "//h3[contains(text(), 'Financial details')]/ancestor::div[1]/following-sibling::div[1]/div[1]//nlb-amount//span[2]";
        WebElement currencyElement = SelectByXpath.CreateElementByXpath(currencyxPath);
        assertTrue(currencyElement.isDisplayed());
        assertEquals("EUR", currencyElement.getAttribute("innerText"));
    }

    @And("Assert Monthly annuity is displayed correctly in Financial details for Loan")
    public void assertMonthlyAnnuityIsDisplayedCorrectlyInFinancialDetailsForLoan() throws Throwable {
        //monthly annuity title
        String MAxPath = "//h3[contains(text(), 'Financial details')]/ancestor::div[1]/following-sibling::div[1]/div[2]/div[1]";
        WebElement MAElement = SelectByXpath.CreateElementByXpath(MAxPath);
        assertTrue(MAElement.isDisplayed());
        assertEquals("Monthly annuity", MAElement.getAttribute("innerText"));
        //amount
        String amountxPath = "//h3[contains(text(), 'Financial details')]/ancestor::div[1]/following-sibling::div[1]/div[2]//nlb-amount//span[1]";
        WebElement amountElement = SelectByXpath.CreateElementByXpath(amountxPath);
        assertTrue(amountElement.isDisplayed());
        assertTrue(amountElement.getAttribute("innerText").matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{2}"));
        //currency
        String currencyxPath = "//h3[contains(text(), 'Financial details')]/ancestor::div[1]/following-sibling::div[1]/div[2]//nlb-amount//span[2]";
        WebElement currencyElement = SelectByXpath.CreateElementByXpath(currencyxPath);
        assertTrue(currencyElement.isDisplayed());
        assertEquals("EUR", currencyElement.getAttribute("innerText"));
    }

    @And("Assert Interest rate is displayed correctly in Financial details for Loan")
    public void assertInterestRateIsDisplayedCorrectlyInFinancialDetailsForLoan() throws Throwable {
        //interest rate title
        String IRxPath = "//h3[contains(text(), 'Financial details')]/ancestor::div[1]/following-sibling::div[1]/div[3]/div[1]";
        WebElement IRElement = SelectByXpath.CreateElementByXpath(IRxPath);
        assertTrue(IRElement.isDisplayed());
        assertEquals("Interest rate", IRElement.getAttribute("innerText"));
        //interest rate amount in %
        String amountxPath = "//h3[contains(text(), 'Financial details')]/ancestor::div[1]/following-sibling::div[1]/div[3]/div[2]/div";
        WebElement amountElement = SelectByXpath.CreateElementByXpath(amountxPath);
        assertTrue(amountElement.isDisplayed());
        assertTrue(amountElement.getAttribute("innerText").matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{2}[%]{1}"));
    }

    @And("Assert Start date is displayed correctly in Account details for Loan")
    public void assertStartDateIsDisplayedCorrectlyInAccountDetailsForLoan() throws Throwable {
        //start date title
        String titlexPath = "//h3[contains(text(), 'Account details')]/ancestor::div[1]/following-sibling::div[1]/div[2]/div[1]";
        WebElement titleElement = SelectByXpath.CreateElementByXpath(titlexPath);
        assertTrue(titleElement.isDisplayed());
        assertEquals("Start date", titleElement.getAttribute("innerText"));
        //start date value
        String datexPath = "//h3[contains(text(), 'Account details')]/ancestor::div[1]/following-sibling::div[1]/div[2]/div[2]/div";
        WebElement dateElement = SelectByXpath.CreateElementByXpath(datexPath);
        assertTrue(dateElement.isDisplayed());
        assertTrue(dateElement.getAttribute("innerText").matches("^(0[1-9]|[1-2][0-9]|3[01])\\.(0[1-9]|1[0-2])\\.\\d{4}$"));
    }

    @And("Assert Repayment period is displayed correctly in Account details for Loan")
    public void assertRepaymentPeriodIsDisplayedCorrectlyInAccountDetailsForLoan() throws Throwable {
        //repayment period title
        String titlexPath = "//h3[contains(text(), 'Account details')]/ancestor::div[1]/following-sibling::div[1]/div[3]/div[1]";
        WebElement titleElement = SelectByXpath.CreateElementByXpath(titlexPath);
        assertTrue(titleElement.isDisplayed());
        assertEquals("Repayment period", titleElement.getAttribute("innerText"));
        //repayment period value
        String periodxPath = "//h3[contains(text(), 'Account details')]/ancestor::div[1]/following-sibling::div[1]/div[3]/div[2]/div";
        WebElement periodElement = SelectByXpath.CreateElementByXpath(periodxPath);
        assertTrue(periodElement.isDisplayed());
        assertTrue(periodElement.getAttribute("innerText").matches("^(?!0\\b)\\d{1,3} months$"));
    }

    @And("Assert Remaining period is displayed correctly in Account details for Loan")
    public void assertRemainingPeriodIsDisplayedCorrectlyInAccountDetailsForLoan() throws Throwable {
        //repayment period title
        String titlexPath = "//h3[contains(text(), 'Account details')]/ancestor::div[1]/following-sibling::div[1]/div[4]/div[1]";
        WebElement titleElement = SelectByXpath.CreateElementByXpath(titlexPath);
        assertTrue(titleElement.isDisplayed());
        assertEquals("Remaining period", titleElement.getAttribute("innerText"));
        //repayment period value
        String periodxPath = "//h3[contains(text(), 'Account details')]/ancestor::div[1]/following-sibling::div[1]/div[4]/div[2]/div";
        WebElement periodElement = SelectByXpath.CreateElementByXpath(periodxPath);
        assertTrue(periodElement.isDisplayed());
        assertTrue(periodElement.getAttribute("innerText").matches("^(?!0\\b)\\d{1,3} months$"));
    }

    @And("Assert Number of all asset units is displayed correctly")
    public void assertNumberOfAllAssetUnitsIsDisplayedCorrectly() throws Throwable {
        //Number of all asset units title
        String titlexPath = "//nlb-heading-text/div[contains(text(), ' Number of asset units ')]";
        WebElement titleElement = SelectByXpath.CreateElementByXpath(titlexPath);
        assertTrue(titleElement.isDisplayed());
        //amount
        String amountxPath = "//div[contains(text(), 'Number of asset units ')]/ancestor::nlb-heading-text/following-sibling::nlb-heading-text//nlb-amount//span";
        WebElement amountElement = SelectByXpath.CreateElementByXpath(amountxPath);
        assertTrue(amountElement.isDisplayed());
        assertTrue(amountElement.getAttribute("innerText").matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{6}"));
    }

    @And("Assert tabs in Product details are displayed correctly for Funds")
    public void assertTabsInProductDetailsAreDisplayedCorrectlyForFunds() throws Throwable {
        String xPath = "//nlb-tabs//a";
        List<WebElement> tabsElements = SelectByXpath.CreateElementsByXpath(xPath);
        int numOfTabs = tabsElements.size();
        for (int i = 0; i < numOfTabs; i++) {
            if (i == 0) {
                assertEquals("Transactions", tabsElements.get(i).getAttribute("innerText"));
            } else if (i == 1) {
                assertEquals("Details", tabsElements.get(i).getAttribute("innerText"));
            } else if (i == 2) {
                assertEquals("Top-up and Savings", tabsElements.get(i).getAttribute("innerText"));
            } else {
                fail("More than 3 tabs are found");
            }
        }

        String defaultSelectedxPath = "//nlb-tabs//a[contains(@class, ' tw-text-primaryColor')]";
        WebElement defaultSelectedElement = SelectByXpath.CreateElementByXpath(defaultSelectedxPath);
        assertEquals("Transactions", defaultSelectedElement.getAttribute("innerText"));
    }

    @And("Assert transactions filters are displayed correctly in Products details for Funds")
    public void assertTransactionsFiltersAreDisplayedCorrectlyInProductsDetailsForFunds() throws Throwable {
        String xPath = "//nlb-selected-product-transactions-filters//nlb-circle-button/button";
        List<WebElement> elements = SelectByXpath.CreateElementsByXpath(xPath);
        int numOfFilters = elements.size();
        for (int i = 0; i < numOfFilters; i++) {
            if (i == 0) {
                assertEquals("Open calendar", elements.get(i).getAttribute("aria-label"));
                assertTrue(elements.get(i).isDisplayed());
            } else if (i == 1) {
                assertTrue(elements.get(i).isDisplayed());
            } else if (i == 2) {
                /*assertEquals("Toggle dropdown", elements.get(i).getAttribute("aria-label"));
                assertTrue(elements.get(i).isDisplayed());*/
            } else {
                fail("More than 3 buttons are found");
            }
        }
    }

    @And("Remember current balance and number of all asset units for Fund from Excel {string} columnName {string} under keys {string} and {string} and assert {string} currency")
    public void rememberCurrentBalanceAndNumberOfAllAssetUnitsForFundFromExcelColumnNameUnderKeysAndAndAssertCurrency(String rowindex, String columnName, String currBal, String numOfAssets, String expectedCurrency) throws Throwable {
        String subtitle = DataManager.getDataFromHashDatamap(rowindex, columnName);
        //current balance
        String xPath1 = "//div[contains(text(),'" + subtitle + "')]//ancestor::div[3]/div[2]//nlb-heading-text[2]//nlb-amount//span[1]";
        WebElement element1 = SelectByXpath.CreateElementByXpath(xPath1);
        DataManager.userObject.put(currBal, element1.getAttribute("innerText"));
        //current balance currency
        String xPath2 = "//div[contains(text(),'" + subtitle + "')]//ancestor::div[3]/div[2]//nlb-heading-text[2]//nlb-amount//span[2]";
        WebElement element2 = SelectByXpath.CreateElementByXpath(xPath2);
        assertEquals(expectedCurrency, element2.getAttribute("innerText"));
        //number of all asset units
        String xPath3 = "//div[contains(text(),'" + subtitle + "')]//ancestor::div[3]/div[2]//nlb-heading-text[4]//nlb-amount//span";
        WebElement element3 = SelectByXpath.CreateElementByXpath(xPath3);
        DataManager.userObject.put(numOfAssets, element3.getAttribute("innerText"));
    }

    @And("Assert Current balance in Funds is the same as in balance under key {string}")
    public void assertCurrentBalanceInFundsIsTheSameAsInBalanceUnderKey(String key) throws Throwable {
        String expected = DataManager.userObject.get(key).toString();
        String xPath = "//h2/nlb-amount//span[1]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertEquals(expected, element.getAttribute("innerText"));
    }

    @And("Assert Number of all assets is the same as number under key {string}")
    public void assertNumberOfAllAssetsIsTheSameAsNumberUnderKey(String key) throws Throwable {
        String expected = DataManager.userObject.get(key).toString();
        String xPath = "//h2/ancestor::nlb-heading-text/following-sibling::div//nlb-amount//span";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertEquals(expected, element.getAttribute("innerText"));
    }

    @And("Assert Account holder is from Excel {string} columnName {string} in subfund details for Funds")
    public void assertAccountHolderIsFromExcelColumnNameInSubfundDetailsForFunds(String rowindex, String columnName) throws Throwable {
        String ownerName = DataManager.getDataFromHashDatamap(rowindex, columnName);
        //Account holder title
        String xPath1 = "//h3[contains(text(), 'Subfund details')]/ancestor::div[1]/following-sibling::*[1]/div[1]/*[1]";
        WebElement element1 = SelectByXpath.CreateElementByXpath(xPath1);
        assertTrue(element1.isDisplayed());
        assertEquals("Account owner", element1.getAttribute("innerText"));
        //Account holder value
        String xPath2 = "//h3[contains(text(), 'Subfund details')]/ancestor::div[1]/following-sibling::*[1]/div[1]/*[2]/div";
        WebElement element2 = SelectByXpath.CreateElementByXpath(xPath2);
        assertTrue(element2.isDisplayed());
        assertEquals(ownerName, element2.getAttribute("innerText"));
    }

    @And("Assert Sub fund ownership is displayed correctly in Subfund details for Funds")
    public void assertSubFundOwnershipIsDisplayedCorrectlyInSubfundDetailsForFunds() throws Throwable {
        //Sub fund ownership title
        String xPath1 = "//h3[contains(text(), 'Subfund details')]/ancestor::div[1]/following-sibling::*[1]/div[2]/*[1]";
        WebElement element1 = SelectByXpath.CreateElementByXpath(xPath1);
        assertTrue(element1.isDisplayed());
        assertEquals("Subfund ownership", element1.getAttribute("innerText"));
        //Sub fund ownership value
        String xPath2 = "//h3[contains(text(), 'Subfund details')]/ancestor::div[1]/following-sibling::*[1]/div[2]/*[2]/div";
        WebElement element2 = SelectByXpath.CreateElementByXpath(xPath2);
        assertTrue(element2.isDisplayed());
        assertEquals("Owned", element2.getAttribute("innerText"));
    }

    @And("Assert Application form number is displayed correctly in Subfund details for Funds")
    public void assertApplicationFormNumberIsDisplayedCorrectlyInSubfundDetailsForFunds() throws Throwable {
        //Application form number title
        String xPath1 = "//h3[contains(text(), 'Subfund details')]/ancestor::div[1]/following-sibling::*[1]/div[3]/*[1]";
        WebElement element1 = SelectByXpath.CreateElementByXpath(xPath1);
        assertTrue(element1.isDisplayed());
        assertEquals("Application form number", element1.getAttribute("innerText"));
        //Application form number value
        String xPath2 = "//h3[contains(text(), 'Subfund details')]/ancestor::div[1]/following-sibling::*[1]/div[3]/*[2]/div";
        WebElement element2 = SelectByXpath.CreateElementByXpath(xPath2);
        assertTrue(element2.isDisplayed());
        assertTrue(element2.getAttribute("innerText").matches("\\d{8}"));
    }

    @And("Assert Subfund account number is from Excel {string} columnName {string} in Subfund details for Funds")
    public void assertSubfundAccountNumberIsFromExcelColumnNameInSubfundDetailsForFunds(String rowindex, String columnName) throws Throwable {
        String accountNumber = DataManager.getDataFromHashDatamap(rowindex, columnName);
        //Subfund account number title
        String xPath1 = "//h3[contains(text(), 'Subfund details')]/ancestor::div[1]/following-sibling::*[1]/div[5]/*[1]";
        WebElement element1 = SelectByXpath.CreateElementByXpath(xPath1);
        assertTrue(element1.isDisplayed());
        assertEquals("Subfund account number", element1.getAttribute("innerText"));
        //Subfund account number value
        String xPath2 = "//h3[contains(text(), 'Subfund details')]/ancestor::div[1]/following-sibling::*[1]/div[5]/*[2]/nlb-iban";
        WebElement element2 = SelectByXpath.CreateElementByXpath(xPath2);
        assertTrue(element2.isDisplayed());
        assertEquals(accountNumber, element2.getAttribute("innerText"));
    }

    @And("Assert Subfund name is from Excel {string} columnName {string} in Subfund details for Funds")
    public void assertSubfundNameIsFromExcelColumnNameInSubfundDetailsForFunds(String rowindex, String columnName) throws Throwable {
        String expected = DataManager.getDataFromHashDatamap(rowindex, columnName);
        //Sub fund name title
        String xPath1 = "//h3[contains(text(), 'Subfund details')]/ancestor::div[1]/following-sibling::*[1]/div[4]/*[1]";
        WebElement element1 = SelectByXpath.CreateElementByXpath(xPath1);
        assertTrue(element1.isDisplayed());
        assertEquals("Subfund name", element1.getAttribute("innerText"));
        //Sub fund name value
        String xPath2 = "//h3[contains(text(), 'Subfund details')]/ancestor::div[1]/following-sibling::*[1]/div[4]/*[2]/div";
        WebElement element2 = SelectByXpath.CreateElementByXpath(xPath2);
        assertTrue(element2.isDisplayed());
        assertEquals(expected, element2.getAttribute("innerText"));
    }

    @And("Assert Asset unit value is displayed correctly in Financial details")
    public void assertAssetUnitValueIsDisplayedCorrectlyInFinancialDetails() throws Throwable {
        //Asset unit value title
        String xPath1 = "//h3[contains(text(), 'Financial details')]/ancestor::div[1]/following-sibling::*[1]/div[1]/*[1]";
        WebElement element1 = SelectByXpath.CreateElementByXpath(xPath1);
        assertTrue(element1.isDisplayed());
        assertEquals("Asset unit value", element1.getAttribute("innerText"));
        //amount
        String xPath2 = "//h3[contains(text(), 'Financial details')]/ancestor::div[1]/following-sibling::*[1]/div[1]//nlb-amount//span[1]";
        WebElement element2 = SelectByXpath.CreateElementByXpath(xPath2);
        assertTrue(element2.isDisplayed());
        assertTrue(element2.getAttribute("innerText").matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{4}"));
        //currency
        String xPath3 = "//h3[contains(text(), 'Financial details')]/ancestor::div[1]/following-sibling::*[1]/div[1]//nlb-amount//span[2]";
        WebElement element3 = SelectByXpath.CreateElementByXpath(xPath3);
        assertTrue(element3.isDisplayed());
        assertEquals("EUR", element3.getAttribute("innerText"));
    }

    @And("Assert Total investment value is displayed correctly in Financial details")
    public void assertTotalInvestmentValueIsDisplayedCorrectlyInFinancialDetails() throws Throwable {
        //Total investment value title
        String xPath1 = "//h3[contains(text(), 'Financial details')]/ancestor::div[1]/following-sibling::*[1]/div[2]/*[1]";
        WebElement element1 = SelectByXpath.CreateElementByXpath(xPath1);
        assertTrue(element1.isDisplayed());
        assertEquals("Total investment value", element1.getAttribute("innerText"));
        //amount
        String xPath2 = "//h3[contains(text(), 'Financial details')]/ancestor::div[1]/following-sibling::*[1]/div[2]//nlb-amount//span[1]";
        WebElement element2 = SelectByXpath.CreateElementByXpath(xPath2);
        assertTrue(element2.isDisplayed());
        assertTrue(element2.getAttribute("innerText").matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{2}"));
        //currency
        String xPath3 = "//h3[contains(text(), 'Financial details')]/ancestor::div[1]/following-sibling::*[1]/div[2]//nlb-amount//span[2]";
        WebElement element3 = SelectByXpath.CreateElementByXpath(xPath3);
        assertTrue(element3.isDisplayed());
        assertEquals("EUR", element3.getAttribute("innerText"));
    }

    @And("Assert Total number of asset units is displayed correctly in Financial details")
    public void assertTotalNumberOfAssetUnitsIsDisplayedCorrectlyInFinancialDetails() throws Throwable {
        //Total number of asset units title
        String xPath1 = "//h3[contains(text(), 'Financial details')]/ancestor::div[1]/following-sibling::*[1]/div[3]/*[1]";
        WebElement element1 = SelectByXpath.CreateElementByXpath(xPath1);
        assertTrue(element1.isDisplayed());
        assertEquals("Total number of asset units", element1.getAttribute("innerText"));
        //Total number of asset units value
        String xPath2 = "//h3[contains(text(), 'Financial details')]/ancestor::div[1]/following-sibling::*[1]/div[3]/*[2]/div";
        WebElement element2 = SelectByXpath.CreateElementByXpath(xPath2);
        assertTrue(element2.isDisplayed());
        assertTrue(element2.getAttribute("innerText").matches("^(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{6}$"));
    }

    @And("Assert text under Movement of net asset value per sub fund unit is correct in Funds")
    public void assertTextUnderMovementOfNetAssetValuePerSubFundUnitIsCorrectInFunds() throws Throwable {
        String expected = "For more information on movement of net asset values per subfund unit see NLB Skladi Tečajnica.";
        String xPath = "//h3[contains(text(), 'Movement of net asset value')]/ancestor::div[1]/following-sibling::*[1]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
        assertEquals(expected, element.getAttribute("innerText"));
    }

    @And("Assert link Go to NLB Skladi tecajnica in Funds is displayed and sends to page with url {string}")
    public void assertLinkGoToNLBSkladiTecajnicaInFundsIsDisplayedAndSendsToPageWithUrl(String expectedUrl) throws Throwable {
        String xPath = "//h3[contains(text(), 'Movement of net asset value')]/ancestor::div[1]/following-sibling::*[2]/nlb-link/span[contains(text(), 'Go to NLB Skladi Tečajnica')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
        assertTrue(JSHelpers.checkIfWebElementIsClickable(element));
        hp.ClickOnElement(element);
        hp.switchToTabWithIndex(2);
        WaitHelpers.waitForSeconds(10);
        String URL = driver.getCurrentUrl();
        assertEquals(expectedUrl, URL);
        JSHelpers.closeCurrentTab();
        hp.switchToTabWithIndex(1);
    }

    @And("Assert available balance and converted value are displayed correctly in Product details for Savings")
    public void assertAvailableBalanceAndConvertedValueAreDisplayedCorrectlyInProductDetailsForSavings() throws Throwable {
        String currentEnv = DataManager.getDataFromHashDatamap("1", "currentEnv");
        if (currentEnv.equals("uat")){
            List<WebElement> elements = driver.findElements(By.xpath("//nlb-account-balance-card"));

            if (elements.isEmpty()) {
                System.out.println("Element not found.");
            } else {


                String titlexPath = "//nlb-account-balance-card//nlb-heading-text/following-sibling::div//dt[contains(@class,'tw-text-gray-400')]";
                List<WebElement> titleElements = SelectByXpath.CreateElementsByXpath(titlexPath);
                int numOfTitles = titleElements.size();
                assertTrue(numOfTitles > 0);
                for (int i = 0; i < numOfTitles; i++) {
                    if (i == 0) {
                        assertEquals("Booked balance", titleElements.get(i).getAttribute("innerText"));
                    } else {
                        assertEquals("Converted value", titleElements.get(i).getAttribute("innerText"));
                    }
                }

                String amountxPath = "//nlb-account-balance-card//nlb-heading-text/following-sibling::div//nlb-amount//span[1]";
                List<WebElement> amountElements = SelectByXpath.CreateElementsByXpath(amountxPath);
                for (WebElement element : amountElements) {
                    assertTrue(element.getAttribute("innerText").matches("(?:(?:0|[1-9]\\d{0,2})(?:\\.\\d{3})*),\\d{2}"));
                }

                String currencyxPath = "//nlb-account-balance-card//nlb-heading-text/following-sibling::div//nlb-amount//span[2]";
                List<WebElement> currencyElements = SelectByXpath.CreateElementsByXpath(currencyxPath);
                for (WebElement element : currencyElements) {
                    assertEquals("EUR", element.getAttribute("innerText"));
                }

            }
        }
        if (currentEnv.equals("tst")){
            List<WebElement> elements = driver.findElements(By.xpath("//nlb-account-balance-card"));

            if (elements.isEmpty()) {
                System.out.println("Element not found.");
            } else {


                String titlexPath = "//nlb-account-balance-card//nlb-heading-text/following-sibling::div//dt[contains(@class,'tw-text-gray-400')]";
                List<WebElement> titleElements = SelectByXpath.CreateElementsByXpath(titlexPath);
                int numOfTitles = titleElements.size();
                assertTrue(numOfTitles > 0);
                for (int i = 0; i < numOfTitles; i++) {
                    if (i == 0) {
                        assertEquals("Booked balance", titleElements.get(i).getAttribute("innerText"));
                    } else {
                        assertEquals("Converted value", titleElements.get(i).getAttribute("innerText"));
                    }
                }

                String amountxPath = "//nlb-account-balance-card//nlb-heading-text/following-sibling::div//nlb-amount//span[1]";
                List<WebElement> amountElements = SelectByXpath.CreateElementsByXpath(amountxPath);
                for (WebElement element : amountElements) {
                    assertTrue(element.getAttribute("innerText").matches("(?:(?:0|[1-9]\\d{0,2})(?:\\.\\d{3})*),\\d{2}"));
                }

                String currencyxPath = "//nlb-account-balance-card//nlb-heading-text/following-sibling::div//nlb-amount//span[2]";
                List<WebElement> currencyElements = SelectByXpath.CreateElementsByXpath(currencyxPath);
                for (WebElement element : currencyElements) {
                    assertEquals("EUR", element.getAttribute("innerText"));
                }

            }
        }

    }

    @And("Assert Booked balance is displayed correctly in Products details for Savings account")
    public void assertBookedBalanceIsDisplayedCorrectlyInProductsDetailsForSavingsAccount() throws Throwable {
        //booked balance title
        String titlexPath = "//nlb-heading-text/h5[contains(text(), 'Booked balance')]";
        WebElement titleElement = SelectByXpath.CreateElementByXpath(titlexPath);
        assertTrue(titleElement.isDisplayed());
        //amount
        String amountxPath = "//h5[contains(text(), 'Booked balance')]/ancestor::nlb-heading-text/following-sibling::nlb-heading-text//nlb-amount//span[1]";
        WebElement amountElement = SelectByXpath.CreateElementByXpath(amountxPath);
        assertTrue(amountElement.isDisplayed());
        assertTrue(amountElement.getAttribute("innerText").matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{2}"));
        //currency
        String currencyxPath = "//h5[contains(text(), 'Booked balance')]/ancestor::nlb-heading-text/following-sibling::nlb-heading-text//nlb-amount//span[2]";
        WebElement currencyElement = SelectByXpath.CreateElementByXpath(currencyxPath);
        assertTrue(currencyElement.isDisplayed());
        assertEquals("EUR", currencyElement.getAttribute("innerText"));
    }

    @And("Assert Account type is displayed correctly in Account details for Savings account")
    public void assertAccountTypeIsDisplayedCorrectlyInAccountDetailsForSavingsAccount() throws Throwable {
        //account type title
        String titlexPath = "//h3[contains(text(), 'Account details')]/ancestor::div[1]/following-sibling::dl[1]/div[1]/dt";
        WebElement titleElement = SelectByXpath.CreateElementByXpath(titlexPath);
        assertTrue(titleElement.isDisplayed());
        assertEquals("Account type", titleElement.getAttribute("innerText"));
        //account type value
        String ATxPath = "//h3[contains(text(), 'Account details')]/ancestor::div[1]/following-sibling::dl[1]/div[1]/dd";
        WebElement ATElement = SelectByXpath.CreateElementByXpath(ATxPath);
        assertTrue(ATElement.isDisplayed());
        assertEquals("Savings Account", ATElement.getAttribute("innerText"));
    }

    @And("Assert Purpose is displayed correctly in Account details for Savings account")
    public void assertPurposeIsDisplayedCorrectlyInAccountDetailsForSavingsAccount() throws Throwable {
        //purpose title
        String titlexPath = "//h3[contains(text(), 'Account details')]/ancestor::div[1]/following-sibling::dl[1]/div[4]/dt";
        WebElement titleElement = SelectByXpath.CreateElementByXpath(titlexPath);
        assertTrue(titleElement.isDisplayed());
        assertEquals("Purpose", titleElement.getAttribute("innerText"));
        //purpose value
        String purposexPath = "//h3[contains(text(), 'Account details')]/ancestor::div[1]/following-sibling::dl[1]/div[4]/dd/div";
        WebElement purposeElement = SelectByXpath.CreateElementByXpath(purposexPath);
        assertTrue(purposeElement.isDisplayed());
        String currentEnv = DataManager.getDataFromHashDatamap("1", "currentEnv");
        if (currentEnv.equals("tst")){
            assertEquals("VARČEVALNI RAČUN", purposeElement.getAttribute("innerText"));
        } else {
            assertEquals("VARČEVANJE", purposeElement.getAttribute("innerText"));
        }
    }


    @And("Remember deposit amount for account from Excel {string} columnName {string} under key {string} and assert {string} currency")
    public void rememberDepositAmountForAccountFromExcelColumnNameUnderKeyAndAssertCurrency(String rowindex, String columnName, String key, String expectedCurrency) throws Throwable {
        String iban = DataManager.getDataFromHashDatamap(rowindex, columnName);
        //deposit amount
        String xPath1 = "//div[contains(text(),'" + iban + "')]//ancestor::div[3]/div[2]//nlb-heading-text[2]//nlb-amount//span[1]";
        WebElement element1 = SelectByXpath.CreateElementByXpath(xPath1);
        DataManager.userObject.put(key, element1.getAttribute("innerText"));
        //deposit currency
        String xPath2 = "//div[contains(text(),'" + iban + "')]//ancestor::div[3]/div[2]//nlb-heading-text[2]//nlb-amount//span[2]";
        WebElement element2 = SelectByXpath.CreateElementByXpath(xPath2);
        assertEquals(expectedCurrency, element2.getAttribute("innerText"));
    }

    @And("Assert that product card of name {string} and IBAN {string} from Excel {string} for Deposit are shown correctly in currency {string}")
    public void assertThatProductCardOfNameAndIBANFromExcelForDepositAreShownCorrectlyInCurrency(String columnName1, String columnName2, String rowindex, String currency) throws Throwable {
        String productName = DataManager.getDataFromHashDatamap(rowindex, columnName1);
        String productIban = DataManager.getDataFromHashDatamap(rowindex, columnName2);
        String xPathForProductCard1 = "//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//*[contains(text(),'Deposit amount')]";
        String xPathForRemainingDebt = "(//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//nlb-heading-text//span[1])[1]";
        String xPathForRemainingDebtCurrency = "(//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//nlb-heading-text//span[2])[1]";
        String xPathIcon = "//div[contains(text(), '" + productIban + "')]/preceding-sibling::div//img";

        WebElement elementForProductCard1 = SelectByXpath.CreateElementByXpath(xPathForProductCard1);
        assertTrue(elementForProductCard1.isDisplayed());
        WebElement elementForRemainingDebt = SelectByXpath.CreateElementByXpath(xPathForRemainingDebt);
        String stringRemainingDebt = elementForRemainingDebt.getAttribute("innerText");
        assertTrue(stringRemainingDebt.matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{2}"));
        WebElement elementForRemainingDebtCurrency = SelectByXpath.CreateElementByXpath(xPathForRemainingDebtCurrency);
        String stringRemainingDebtCurrency = elementForRemainingDebtCurrency.getAttribute("innerText");
        assertTrue(stringRemainingDebtCurrency.contains(currency));
        WebElement iconElement = SelectByXpath.CreateElementByXpath(xPathIcon);
        assertTrue(iconElement.isDisplayed());
        assertEquals("https://test.dbp.nlb.si/web-retail/assets/img/product-icon/TermDepositAccount-Icon.svg", iconElement.getAttribute("src"));
    }

    @And("Assert Deposit amount is displayed correctly in Deposit for currency {string}")
    public void assertDepositAmountIsDisplayedCorrectlyInDepositForCurrency(String currency) throws Throwable {
        //title
        String xPath1 = "(//nlb-heading-text[1]/div)[1]";
        WebElement element1 = SelectByXpath.CreateElementByXpath(xPath1);
        assertTrue(element1.isDisplayed());
        assertEquals("Term deposit amount", element1.getAttribute("innerText"));
        //amount
        String xPath2 = "//*[contains(text(), 'Term deposit amount')]/ancestor::nlb-heading-text/following-sibling::nlb-heading-text//nlb-amount//span[1]";
        WebElement element2 = SelectByXpath.CreateElementByXpath(xPath2);
        assertTrue(element2.isDisplayed());
        assertTrue(element2.getAttribute("innerText").matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{2}"));
        //currency
        String xPath3 = "//*[contains(text(), 'Term deposit amount')]/ancestor::nlb-heading-text/following-sibling::nlb-heading-text//nlb-amount//span[2]";
        WebElement element3 = SelectByXpath.CreateElementByXpath(xPath3);
        assertTrue(element3.isDisplayed());
        assertEquals(currency, element3.getAttribute("innerText"));
    }

    @And("Assert Deposit amount is value from key {string}")
    public void assertDepositAmountIsValueFromKey(String key) throws Throwable {
        String expected = DataManager.userObject.get(key).toString();
        String xPath = "//*[contains(text(), 'Term deposit amount')]/ancestor::nlb-heading-text/following-sibling::nlb-heading-text//nlb-amount//span[1]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertEquals(expected, element.getAttribute("innerText"));
    }

    @And("Assert Deposited amount is displayed correctly in Financial details for Deposit with {string} currency")
    public void assertDepositedAmountIsDisplayedCorrectlyInFinancialDetailsForDepositWithCurrency(String currency) throws Throwable {
        //deposited amount title
        String titlexPath = "//*[contains(text(), 'Financial details')]/ancestor::div[1]/following-sibling::*[1]/div[1]/*[1]";
        WebElement titleElement = SelectByXpath.CreateElementByXpath(titlexPath);
        assertTrue(titleElement.isDisplayed());
        assertEquals("Term deposit amount", titleElement.getAttribute("innerText"));
        //amount
        String amountxPath = "//*[contains(text(), 'Financial details')]/ancestor::div[1]/following-sibling::*[1]/div[1]//nlb-amount//span[1]";
        WebElement amountElement = SelectByXpath.CreateElementByXpath(amountxPath);
        assertTrue(amountElement.isDisplayed());
        assertTrue(amountElement.getAttribute("innerText").matches("(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{2}"));
        //currency
        String currencyxPath = "//*[contains(text(), 'Financial details')]/ancestor::div[1]/following-sibling::*[1]/div[1]//nlb-amount//span[2]";
        WebElement currencyElement = SelectByXpath.CreateElementByXpath(currencyxPath);
        assertTrue(currencyElement.isDisplayed());
        assertEquals(currency, currencyElement.getAttribute("innerText"));
    }

    @And("Assert Interest rate is displayed correctly in Financial details for Deposit")
    public void assertInterestRateIsDisplayedCorrectlyInFinancialDetailsForDeposit() throws Throwable {
        //interest rate title
        String IRxPath = "//*[contains(text(), 'Financial details')]/ancestor::div[1]/following-sibling::*[1]/div[2]/*[1]";
        WebElement IRElement = SelectByXpath.CreateElementByXpath(IRxPath);
        assertTrue(IRElement.isDisplayed());
        assertEquals("Interest rate", IRElement.getAttribute("innerText"));
        //interest rate amount in %
        String amountxPath = "//*[contains(text(), 'Financial details')]/ancestor::div[1]/following-sibling::*[1]/div[2]/*[2]/div";
        WebElement amountElement = SelectByXpath.CreateElementByXpath(amountxPath);
        assertTrue(amountElement.isDisplayed());
        assertTrue(amountElement.getAttribute("innerText").matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{4}[%]{1}"));
    }

    @And("Assert Accrued interest is displayed correctly in Financial details for Deposit with currency {string}")
    public void assertAccruedInterestIsDisplayedCorrectlyInFinancialDetailsForDepositWithCurrency(String currency) throws Throwable {
        //accrued interest title
        String IRxPath = "//*[contains(text(), 'Financial details')]/ancestor::div[1]/following-sibling::*[1]/div[3]/*[1]";
        WebElement IRElement = SelectByXpath.CreateElementByXpath(IRxPath);
        assertTrue(IRElement.isDisplayed());
        assertEquals("Accrued interest", IRElement.getAttribute("innerText"));
        //amount
        String amountxPath = "//*[contains(text(), 'Financial details')]/ancestor::div[1]/following-sibling::*[1]/div[3]//nlb-amount//span[1]";
        WebElement amountElement = SelectByXpath.CreateElementByXpath(amountxPath);
        assertTrue(amountElement.isDisplayed());
        assertTrue(amountElement.getAttribute("innerText").matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{2}"));
        //currency
        String currencyxPath = "//*[contains(text(), 'Financial details')]/ancestor::div[1]/following-sibling::*[1]/div[3]//nlb-amount//span[2]";
        WebElement currencyElement = SelectByXpath.CreateElementByXpath(currencyxPath);
        assertTrue(currencyElement.isDisplayed());
        assertEquals(currency, currencyElement.getAttribute("innerText"));
    }

    @And("Assert Maturity account is from Excel {string} columnName {string} in Financial details for Deposit")
    public void assertMaturityAccountIsFromExcelColumnNameInFinancialDetailsForDeposit(String rowindex, String columnName) throws Throwable {
        String expected = DataManager.getDataFromHashDatamap(rowindex, columnName);
        //maturity account title
        String xPath1 = "//*[contains(text(), 'Financial details')]/ancestor::div[1]/following-sibling::*[1]/div[4]/*[1]";
        WebElement element1 = SelectByXpath.CreateElementByXpath(xPath1);
        assertTrue(element1.isDisplayed());
        assertEquals("Pay out account", element1.getAttribute("innerText"));
        //maturity account value
        String xPath2 = "//*[contains(text(), 'Financial details')]/ancestor::div[1]/following-sibling::*[1]/div[4]//nlb-iban";
        WebElement element2 = SelectByXpath.CreateElementByXpath(xPath2);
        assertTrue(element2.isDisplayed());
        assertEquals(expected, element2.getAttribute("innerText"));
    }

    @And("Assert Account type is displayed correctly in Account details for Term deposit account")
    public void assertAccountTypeIsDisplayedCorrectlyInAccountDetailsForTermDepositAccount() throws Throwable {
        //account type title
        String titlexPath = "//*[contains(text(), 'Account details')]/ancestor::div[1]/following-sibling::*[1]/div[1]/*[1]";
        WebElement titleElement = SelectByXpath.CreateElementByXpath(titlexPath);
        assertTrue(titleElement.isDisplayed());
        assertEquals("Account type", titleElement.getAttribute("innerText"));
        //account type value
        String ATxPath = "//*[contains(text(), 'Account details')]/ancestor::div[1]/following-sibling::*[1]/div[1]/*[2]/div";
        WebElement ATElement = SelectByXpath.CreateElementByXpath(ATxPath);
        assertTrue(ATElement.isDisplayed());
        assertEquals("Deposit", ATElement.getAttribute("innerText"));
    }

    @And("Assert Opening date is displayed correctly in Account details for Term deposit account")
    public void assertOpeningDateIsDisplayedCorrectlyInAccountDetailsForTermDepositAccount() throws Throwable {
        //opening date title
        String titlexPath = "//*[contains(text(), 'Account details')]/ancestor::div[1]/following-sibling::*[1]/div[4]/*[1]";
        WebElement titleElement = SelectByXpath.CreateElementByXpath(titlexPath);
        assertTrue(titleElement.isDisplayed());
        assertEquals("Opening date", titleElement.getAttribute("innerText"));
        //opening date value
        String datexPath = "//*[contains(text(), 'Account details')]/ancestor::div[1]/following-sibling::*[1]/div[4]/*[2]/div";
        WebElement dateElement = SelectByXpath.CreateElementByXpath(datexPath);
        assertTrue(dateElement.isDisplayed());
        assertTrue(dateElement.getAttribute("innerText").matches("^(0[1-9]|[1-2][0-9]|3[01])\\.(0[1-9]|1[0-2])\\.\\d{4}$"));
    }

    @And("Assert Expiration date is displayed correctly in Account details for Term deposit account")
    public void assertExpirationDateIsDisplayedCorrectlyInAccountDetailsForTermDepositAccount() throws Throwable {
        //expiration date title
        String titlexPath = "//*[contains(text(), 'Account details')]/ancestor::div[1]/following-sibling::*[1]/div[5]/*[1]";
        WebElement titleElement = SelectByXpath.CreateElementByXpath(titlexPath);
        assertTrue(titleElement.isDisplayed());
        assertEquals("Expiration date", titleElement.getAttribute("innerText"));
        //expiraiton date value
        String datexPath = "//*[contains(text(), 'Account details')]/ancestor::div[1]/following-sibling::*[1]/div[5]/*[2]/div";
        WebElement dateElement = SelectByXpath.CreateElementByXpath(datexPath);
        assertTrue(dateElement.isDisplayed());
        assertTrue(dateElement.getAttribute("innerText").matches("^(0[1-9]|[1-2][0-9]|3[01])\\.(0[1-9]|1[0-2])\\.\\d{4}$"));
    }

    @And("Asasert tabs in Vita Product details are displayed correctly")
    public void asasertTabsInVitaProductDetailsAreDisplayedCorrectly() throws Throwable {
        String xPath = "//nlb-tabs//a";
        List<WebElement> tabsElements = SelectByXpath.CreateElementsByXpath(xPath);
        int numOfTabs = tabsElements.size();
        for (int i = 0; i < numOfTabs; i++) {
            if (i == 0) {
                assertEquals("Premiums", tabsElements.get(i).getAttribute("innerText"));
            } else if (i == 1) {
                assertEquals("Izpiski", tabsElements.get(i).getAttribute("innerText"));
            } else if (i == 2) {
                assertEquals("Podrobnosti", tabsElements.get(i).getAttribute("innerText"));
            } else if (i == 3) {
                assertEquals("Funds", tabsElements.get(i).getAttribute("innerText"));
            } else {
                fail("More than 4 tabs are found");
            }
        }

        String defaultSelectedxPath = "//nlb-tabs//a[contains(@class, ' tw-text-primaryColor')]";
        WebElement defaultSelectedElement = SelectByXpath.CreateElementByXpath(defaultSelectedxPath);
        assertEquals("Premiums", defaultSelectedElement.getAttribute("innerText"));
    }

    @And("Assert Insurance policy amount in Vita Product Details")
    public void assertInsurancePolicyAmountInVitaProductDetails() throws Throwable {
        //booked balance title
        String titlexPath = "//nlb-heading-text/h5[contains(text(), 'Insurance amount')]";
        WebElement titleElement = SelectByXpath.CreateElementByXpath(titlexPath);
        assertTrue(titleElement.isDisplayed());
        //amount
        String amountxPath = "//h5[contains(text(), 'Insurance amount')]/ancestor::nlb-heading-text/following-sibling::nlb-heading-text//nlb-amount//span[1]";
        WebElement amountElement = SelectByXpath.CreateElementByXpath(amountxPath);
        assertTrue(amountElement.isDisplayed());
        assertTrue(amountElement.getAttribute("innerText").matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{2}"));
        //currency
        String currencyxPath = "//h5[contains(text(), 'Insurance amount')]/ancestor::nlb-heading-text/following-sibling::nlb-heading-text//nlb-amount//span[2]";
        WebElement currencyElement = SelectByXpath.CreateElementByXpath(currencyxPath);
        assertTrue(currencyElement.isDisplayed());
        assertEquals("EUR", currencyElement.getAttribute("innerText"));
    }

    @And("Assert tabs in Product details are displayed correctly for Vita")
    public void assertTabsInProductDetailsAreDisplayedCorrectlyForVita() throws Throwable {
        String xPath = "//nlb-tabs//a";
        List<WebElement> tabsElements = SelectByXpath.CreateElementsByXpath(xPath);
        int numOfTabs = tabsElements.size();
        for (int i = 0; i < numOfTabs; i++) {
            if (i == 0) {
                assertEquals("Premiums", tabsElements.get(i).getAttribute("innerText"));
            } else if (i == 1) {
                assertEquals("Statements", tabsElements.get(i).getAttribute("innerText"));
            } else if (i == 2) {
                assertEquals("Details", tabsElements.get(i).getAttribute("innerText"));
            } else if (i == 3) {
                assertEquals("Investments", tabsElements.get(i).getAttribute("innerText"));
            } else {
                fail("More than 4 tabs are found");
            }
        }

        String defaultSelectedxPath = "//nlb-tabs//a[contains(@class, ' tw-text-primaryColor')]";
        WebElement defaultSelectedElement = SelectByXpath.CreateElementByXpath(defaultSelectedxPath);
        assertEquals("Premiums", defaultSelectedElement.getAttribute("innerText"));
    }

    @And("Assert Insurance details in product details page is displayed with index {int}")
    public void assertInsuranceDetailsInProductDetailsPageIsDisplayedWithIndex(int index) throws Throwable {
        String xPath = "(//nlb-selected-product-details//nlb-product-details-card["+index+"]//nlb-heading-text/*)[2]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
        assertEquals("Insurance details", element.getAttribute("innerText"));
    }

    @And("Assert Payment frequency is displayec correctly in Financial details for Vita")
    public void assertPaymentFrequencyIsDisplayecCorrectlyInFinancialDetailsForVita() throws Throwable {
        //Payment frequency title
        String titlexPath = "//*[contains(text(), 'Financial details')]/ancestor::div[1]/following-sibling::*[1]/div[1]/*[1]";
        WebElement titleElement = SelectByXpath.CreateElementByXpath(titlexPath);
        assertTrue(titleElement.isDisplayed());
        assertEquals("Payment frequency", titleElement.getAttribute("innerText"));
        //Payment frequency value
        String ATxPath = "//h3[contains(text(), 'Financial details')]/ancestor::div[1]/following-sibling::*[1]/div[1]/*[2]/div";
        WebElement ATElement = SelectByXpath.CreateElementByXpath(ATxPath);
        assertTrue(ATElement.isDisplayed());
        assertEquals("Monthly", ATElement.getAttribute("innerText"));
    }

    @And("Assert Insurer in Insurance details is from Excel {string} columnName {string}")
    public void assertInsurerInInsuranceDetailsIsFromExcelColumnName(String rowindex, String columnName) throws Throwable {
        String insurer = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPath = "//*[text() = 'Insurance details']/ancestor::div[1]/following-sibling::*//div[text() = 'Insurer']/ancestor::*[1]/following-sibling::*/div";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
        assertEquals(insurer, element.getAttribute("innerText"));
    }

    @And("Assert Policy number in Insurance details is from Excel {string} columnName {string}")
    public void assertPolicyNumberInInsuranceDetailsIsFromExcelColumnName(String rowindex, String columnName) throws Throwable {
        String text = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPath = "//*[text() = 'Insurance details']/ancestor::div[1]/following-sibling::*//div[text() = 'Policy number']/ancestor::*[1]/following-sibling::*/div";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
        assertEquals(text, element.getAttribute("innerText"));
    }

    @And("Assert Opening date is displayed correctly in Insurance details for Vita")
    public void assertOpeningDateIsDisplayedCorrectlyInInsuranceDetailsForVita() throws Throwable {
        //opening date title
        String titlexPath = "//*[contains(text(), 'Insurance details')]/ancestor::div[1]/following-sibling::*[1]/div[3]/*[1]";
        WebElement titleElement = SelectByXpath.CreateElementByXpath(titlexPath);
        assertTrue(titleElement.isDisplayed());
        assertEquals("Opening date", titleElement.getAttribute("innerText"));
        //opening date value
        String datexPath = "//*[contains(text(), 'Insurance details')]/ancestor::div[1]/following-sibling::*[1]/div[3]/*[2]/div";
        WebElement dateElement = SelectByXpath.CreateElementByXpath(datexPath);
        assertTrue(dateElement.isDisplayed());
        assertTrue(dateElement.getAttribute("innerText").matches("^(0[1-9]|[1-2][0-9]|3[01])\\.(0[1-9]|1[0-2])\\.\\d{4}$"));
    }

    @And("Assert Starting date is displayed correctly in Insurance details for Vita")
    public void assertStartingDateIsDisplayedCorrectlyInInsuranceDetailsForVita() throws Throwable {
        //Starting date title
        String titlexPath = "//*[contains(text(), 'Insurance details')]/ancestor::div[1]/following-sibling::*[1]/div[4]/*[1]";
        WebElement titleElement = SelectByXpath.CreateElementByXpath(titlexPath);
        assertTrue(titleElement.isDisplayed());
        assertEquals("Starting date", titleElement.getAttribute("innerText"));
        //Starting date value
        String datexPath = "//*[contains(text(), 'Insurance details')]/ancestor::div[1]/following-sibling::*[1]/div[4]/*[2]/div";
        WebElement dateElement = SelectByXpath.CreateElementByXpath(datexPath);
        assertTrue(dateElement.isDisplayed());
        assertTrue(dateElement.getAttribute("innerText").matches("^(0[1-9]|[1-2][0-9]|3[01])\\.(0[1-9]|1[0-2])\\.\\d{4}$"));
    }

    @And("Assert Closing date is displayed correctly in Insurance details for Vita")
    public void assertClosingDateIsDisplayedCorrectlyInInsuranceDetailsForVita() throws Throwable {
        //Closing date title
        String titlexPath = "//*[contains(text(), 'Insurance details')]/ancestor::div[1]/following-sibling::*[1]/div[5]/*[1]";
        WebElement titleElement = SelectByXpath.CreateElementByXpath(titlexPath);
        assertTrue(titleElement.isDisplayed());
        assertEquals("Closing date", titleElement.getAttribute("innerText"));
        //Closing date value
        String datexPath = "//*[contains(text(), 'Insurance details')]/ancestor::div[1]/following-sibling::*[1]/div[5]/*[2]/div";
        WebElement dateElement = SelectByXpath.CreateElementByXpath(datexPath);
        assertTrue(dateElement.isDisplayed());
        assertTrue(dateElement.getAttribute("innerText").matches("^(0[1-9]|[1-2][0-9]|3[01])\\.(0[1-9]|1[0-2])\\.\\d{4}$") || dateElement.getAttribute("innerText").equals("Life-insurance"));
    }

    @And("Assert Policy status is displayed correctly in Insurance details for Vita")
    public void assertPolicyStatusIsDisplayedCorrectlyInInsuranceDetailsForVita() throws Throwable {
        //Policy status title
        String titlexPath = "//*[contains(text(), 'Insurance details')]/ancestor::div[1]/following-sibling::*[1]/div[6]/*[1]";
        WebElement titleElement = SelectByXpath.CreateElementByXpath(titlexPath);
        assertTrue(titleElement.isDisplayed());
        assertEquals("Policy status", titleElement.getAttribute("innerText"));
        //Policy status value
        String ATxPath = "//*[contains(text(), 'Insurance details')]/ancestor::div[1]/following-sibling::*[1]/div[6]/*[2]/div";
        WebElement ATElement = SelectByXpath.CreateElementByXpath(ATxPath);
        assertTrue(ATElement.isDisplayed());
        assertEquals("Not paying any premium", ATElement.getAttribute("innerText"));
    }

    @And("Assert Policy pledge is displayed correctly in Insurance details for Vita")
    public void assertPolicyPledgeIsDisplayedCorrectlyInInsuranceDetailsForVita() throws Throwable {
        //Policy pledge title
        String titlexPath = "//*[contains(text(), 'Insurance details')]/ancestor::div[1]/following-sibling::*[1]/div[7]/*[1]";
        WebElement titleElement = SelectByXpath.CreateElementByXpath(titlexPath);
        assertTrue(titleElement.isDisplayed());
        assertEquals("Policy pledge", titleElement.getAttribute("innerText"));
        //Policy pledge value
        String ATxPath = "//*[contains(text(), 'Insurance details')]/ancestor::div[1]/following-sibling::*[1]/div[7]/*[2]/div";
        WebElement ATElement = SelectByXpath.CreateElementByXpath(ATxPath);
        assertTrue(ATElement.isDisplayed());
        assertEquals("No", ATElement.getAttribute("innerText"));
    }

    @And("Assert there are is no Unpaid Premiums category in Vita details")
    public void assertThereAreIsNoUnpaidPremiumsCategoryInVitaDetails() throws Throwable {
        String xPath = "//*[contains(text(), 'Unpaid premius')]";
        By el = By.xpath(xPath);
        boolean messageExists = ActionApiHelpers.isElementDisplayedCustom(el, 2, 500);
        assertFalse(messageExists);
    }

    @Then("Assert element by tag {string} with descendant tag {string} with text {string}")
    public void assertElementByTagWithDescendantTagWithText(String ancestorTag, String descendantTag, String descendantText) throws Throwable {
        WebElement element = SelectByXpath.CreateElementByXpathTagWithDescendantTagWithText(ancestorTag, descendantTag, descendantText);
        assertTrue(element.isDisplayed());
    }

    @And("Check if standing orders displayed are correct")
    public void checkIfStandingOrdersDisplayedAreCorrect() throws Throwable {
        String xPathForStandingOrderDate = "//nlb-icon//i[contains(@class,'icon-standing-order') and contains(@class,'tw-text-3xl')]//ancestor::div[1]//following-sibling::div//div[1]";
        WebElement elementForStandingOrderDate = SelectByXpath.CreateElementByXpath(xPathForStandingOrderDate);
        String standingOrderDate = elementForStandingOrderDate.getAttribute("innerText");
        assertTrue(standingOrderDate.matches("^(0[1-9]|[12][0-9]|3[01])\\.(0[1-9]|1[0-2])\\.(19|20)\\d{2}$"));

        String xPathForStandingOrderCreditor = "//nlb-icon//i[contains(@class,'icon-standing-order') and contains(@class,'tw-text-3xl')]//ancestor::div[1]//following-sibling::div//div[1]//following-sibling::div//h5[text()='Standing order']//ancestor::div[1]//following-sibling::div[1]";
        WebElement elementForStandingOrderCreditor = SelectByXpath.CreateElementByXpath(xPathForStandingOrderCreditor);
        String standingOrderCreditor = elementForStandingOrderCreditor.getAttribute("innerText");
        assertTrue(!standingOrderCreditor.isEmpty());

        String xPathForStandingOrderCurrency = "(//nlb-payment-item//div//nlb-amount)[1]//span[contains(@class,'xs:tw-block')]";
        WebElement elementForStandingOrderCurrency = SelectByXpath.CreateElementByXpath(xPathForStandingOrderCurrency);
        String standingOrderCurrency = elementForStandingOrderCurrency.getAttribute("innerText");
        assertTrue(standingOrderCurrency.equals("EUR"));

        String xPathForStandingOrderAmount = "(//nlb-payment-item//div//nlb-amount)[1]//span[contains(@class,'xs:tw-block')]//ancestor::div[1]//following-sibling::div";
        WebElement elementForStandingOrderAmount = SelectByXpath.CreateElementByXpath(xPathForStandingOrderAmount);
        String standingOrderAmount = elementForStandingOrderAmount.getAttribute("textContent");
        assertTrue(standingOrderAmount.matches("^\\d{1,3}(?:\\.\\d{3})*,\\d{2}$"));
    }

    @And("Check if standing orders are correctly sorted by dates")
    public void checkIfStandingOrdersAreCorrectlySortedByDates() throws Throwable {
        String xPathForStandingOrderDate = "//nlb-icon//i[contains(@class,'icon-standing-order') and contains(@class,'tw-text-3xl')]//ancestor::div[1]//following-sibling::div//div[1]";
        List<WebElement> webElementList = SelectByXpath.CreateElementsByXpath(xPathForStandingOrderDate);
        List<String> listOfDates = new ArrayList<>();
        for (WebElement element : webElementList) {
            listOfDates.add(element.getAttribute("innerText"));
        }
        assertTrue(rh.areDatesSorted(listOfDates));
    }

    @And("Enter random amount into amount field in Pay or Transfer screen and remember it under key {string} in txt file")
    public void enterRandomAmountIntoAmountFieldInPayOrTransferScreenAndRememberItUnderKeyInTxtFile(String key) throws Throwable {
        String randomAmount = rh.returnRandomAmount();
        String xPathForInputFieldForAmount = "//nlb-input-amount-currency-with-dropdown//input";
        WebElement elementForInputFieldForAmount = SelectByXpath.CreateElementByXpath(xPathForInputFieldForAmount);
        hp.EnterTextToElement(elementForInputFieldForAmount, randomAmount);
        Utilities.saveTheValueToFile(randomAmount, key);
    }

    @And("Assert that debtor account in second step of payment is from Excel {string} columnName {string}")
    public void assertThatDebtorAccountInSecondStepOfPaymentIsFromExcelColumnName(String rowindex, String columnName) throws Throwable {
        String account = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPath = "(//nlb-account-selector)[1]//*[contains(text(),'" + account + "')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
    }

    @And("Assert that UPN creditor account in second step of payment is from Excel {string} columnName {string}")
    public void assertThatUPNCreditorAccountInSecondStepOfPaymentIsFromExcelColumnName(String rowindex, String columnName) throws Throwable {
        String account = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPath = "//nlb-upn-recipient-input-card//*[contains(text(),'" + account + "')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
    }

    @And("Click on the {string} of current or next month and remember date under key {string}")
    public void clickOnTheOfCurrentOrNextMonthAndRememberDateUnderKey(String dayInMonth, String key) throws Throwable {
        String date = rh.getClosestDateInMonth(dayInMonth);
        Utilities.saveTheValueToFile(date, key);
        String dateSlovenian = hp.returnDateInSlovenianFormat(date);
        String xPath = "//*[@aria-label='" + dateSlovenian + "']";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Assert standing order schedule info is correct using date from {string} for until cancellation")
    public void assertStandingOrderScheduleInfoIsCorrectUsingDateFromForUntilCancellation(String key) throws Throwable {
        String date = Utilities.getDataFromTxtFileUnderKey(key);
        String xPath = "//nlb-standing-order-schedule-info";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String actualText = element.getAttribute("innerText");
        String expectedText = "Your standing order will be processed monthly, starting with " + date + " and until you cancel it in line with Payments execution schedule (external link).";
        assertEquals(expectedText, actualText);
    }

    @And("Assert transactions filters are displayed correctly in Products details for Gradual savings")
    public void assertTransactionsFiltersAreDisplayedCorrectlyInProductsDetailsForGradualSavings() throws Throwable {
        String xPath = "//nlb-selected-product-transactions-filters//nlb-circle-button/button";
        List<WebElement> elements = SelectByXpath.CreateElementsByXpath(xPath);
        int numOfFilters = elements.size();
        for (int i = 0; i < numOfFilters; i++) {
            if (i == 0) {
                assertEquals("Open calendar", elements.get(i).getAttribute("aria-label"));
                assertTrue(elements.get(i).isDisplayed());
            } else if (i == 1) {
                assertEquals("Open advanced filters", elements.get(i).getAttribute("aria-label"));
                assertTrue(elements.get(i).isDisplayed());
            } else if (i == 2) {
                assertEquals("Open search", elements.get(i).getAttribute("aria-label"));
                assertTrue(elements.get(i).isDisplayed());
            } else if (i == 3) {
                assertEquals("Toggle dropdown", elements.get(i).getAttribute("aria-label"));
                assertTrue(elements.get(i).isDisplayed());
            } else {
                fail("More than 4 buttons are found");
            }
        }

    }

    @And("Assert that payment purpose is from txt file under key {string}")
    public void assertThatPaymentPurposeIsFromTxtFileUnderKey(String key) throws Throwable {
        String expectedPurpose = Utilities.getDataFromTxtFileUnderKey(key);
        String xPath = "//div[text()='Repeat payment']/ancestor::nlb-payment-item/descendant::nlb-heading-text[1]/h5";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertEquals(expectedPurpose, element.getAttribute("textContent"));
    }

    @And("Try to assert that payment is {string} and send command to Authorize method")
    public void tryToAssertThatPaymentIsAndSendCommandToAuthorizeMethod(String text) throws Throwable {
        rh.tryToAssertThatPaymentIsCompleteAndSendCommandToAuthMethod(text);
    }

    @And("Check if authorization is needed and complete payment with account iban from Excel {string} columnName {string} amount {string} and currency {string} with message {string}")
    public void checkIfAuthorizationIsNeededAndCompletePaymentWithAccountIbanFromExcelColumnNameAmountAndCurrencyWithMessage(String rowindex, String columnName, String amount, String currency, String notifMessage) throws Throwable {
        rh.checkIfAuthIsNeededAndCompletePaymentFor(rowindex, columnName, amount, currency, notifMessage);
    }

    @And("Assert element by tag {string} attribute {string} value {string} with following sibling {string} that has descendant {string} with textContent {string}")
    public void assertElementByTagAttributeValueWithFollowingSiblingThatHasDescendantWithTextContent(String tag, String attribute, String attributeValue, String sibling, String descendant, String text) throws Throwable {
        String xPath = "//" + tag + "[@label='" + attributeValue + "']/following-sibling::" + sibling + "/" + descendant;
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertEquals(text, element.getAttribute("textContent"));
    }

    @And("Select account from Excel {string} columnName {string} with currency {string} as debtor in payment screen")
    public void selectAccountFromExcelColumnNameWithCurrencyAsDebtorInPaymentScreen(String rowindex, String columnName, String currency) throws Throwable {
        String stringForAccountIban = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPathForDebtorSelector = "(//nlb-account-selector)[1]";
        WebElement elementForDebtorSelector = SelectByXpath.CreateElementByXpath(xPathForDebtorSelector);
        hp.ClickOnElement(elementForDebtorSelector);
        String xPathForDebtor = "//div[contains(text(), '" + stringForAccountIban + "')]/ancestor::div[1]/following-sibling::div/span[contains(text(), '" + currency + "')]";
        WebElement elementForDebtorIban = SelectByXpath.CreateElementByXpath(xPathForDebtor);
        hp.ClickOnElement(elementForDebtorIban);

    }

    @And("Assert there is no element by contains text {string}")
    public void assertThereIsNoElementByContainsText(String text) throws Throwable {
        String xPath = "//*[contains(text(), '" + text + "')]";
        By el = By.xpath(xPath);
        boolean messageExists = ActionApiHelpers.isElementDisplayedCustomWithWaitToDisappear(el, 10, 2000);
        assertFalse(messageExists);
    }

    @And("Assert element by label contains text {string} with following sibling {string} that has descendant {string} is readonly")
    public void assertElementByLabelContainsTextWithFollowingSiblingThatHasDescendantIsReadonly(String labelText, String siblingTag, String descendantTag) throws Throwable {
        String xPathForEntryField = "//label[contains(text(),'" + labelText + "')]//following-sibling::" + siblingTag + "//" + descendantTag;
        WebElement elementForAssert = SelectByXpath.CreateElementByXpath(xPathForEntryField);
        assertNotNull(elementForAssert.getAttribute("readonly"));
        assertEquals("true", elementForAssert.getAttribute("readonly"));
    }

    @And("Assert account from Excel {string} columnName {string} with currency {string} is debtor in payment screen")
    public void assertAccountFromExcelColumnNameWithCurrencyIsDebtorInPaymentScreen(String rowindex, String columnName, String currency) throws Throwable {
        String stringForAccountIban = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPathForDebtor = "//div[contains(text(), '" + stringForAccountIban + "')]/ancestor::div[1]/following-sibling::div/span[contains(text(), '" + currency + "')]";
        WebElement elementForDebtorIban = SelectByXpath.CreateElementByXpath(xPathForDebtor);
        assertTrue(elementForDebtorIban.isDisplayed());
    }

    @And("Assert amount field is currency {string} calculated from EUR")
    public void assertAmountFieldIsCurrencyCalculatedFromEUR(String currency) throws Throwable {
        String xPath = "//nlb-input-amount-currency/ancestor::div[2]/div[2]/span";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String currencyText = element.getAttribute("textContent").trim();
        assertTrue(currencyText.matches("^Amount in EUR: \\d{1,3},\\d{2} EUR \\(\\d{1,3},\\d{4} [A-Z]{3} for 1 EUR\\)$"));
        assertTrue(currencyText.contains(currency));
    }

    @And("Remember amount in EUR under key {string}")
    public void rememberAmountInEURUnderKey(String key) throws Throwable {
        String amount = rh.getEurAmountFromCalculatedCurrency();
        DataManager.userObject.put(key, amount);
    }

    @And("Assert {string} in payment review is from key {string}")
    public void assertInPaymentReviewIsFromKey(String text, String key) throws Throwable {
        String expectedValue = DataManager.userObject.get(key).toString();
        String xPathForElementAssert = "//span[contains(text(),'" + text + "')]//following-sibling::span";
        WebElement elementForAssert = SelectByXpath.CreateElementByXpath(xPathForElementAssert);
        assertEquals(expectedValue, elementForAssert.getAttribute("textContent"));
    }


    @And("Remember available balance for account from Excel {string} columnName {string} columnName {string} under key {string}")
    public void rememberAvailableBalanceForAccountFromExcelColumnNameColumnNameUnderKey(String rowindex, String columnName1, String columnName2, String key) throws Throwable {
        String accountIban = DataManager.getDataFromHashDatamap(rowindex, columnName1);
        String accountName = DataManager.getDataFromHashDatamap(rowindex, columnName2);
        String xPath = "(//nlb-product-card//*[contains(text(),'" + accountName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + accountIban + "')]//ancestor::nlb-product-card//nlb-heading-text//span[1])[2]";
        WebElement elementForAvailableAmount = SelectByXpath.CreateElementByXpath(xPath);
        String availableAmount = elementForAvailableAmount.getAttribute("textContent");
        String availableAmountToSave = availableAmount.replace(".", "").replace(",", ".");
        Utilities.saveTheValueToFile(availableAmountToSave, key);
    }

    @And("Enter amount from key {string} increased by {string} into amount input field in Pay or Transfer screen")
    public void enterAmountFromKeyIncreasedByIntoAmountInputFieldInPayOrTransferScreen(String key, String plusAmountString) throws Throwable {
        String amountString = Utilities.getDataFromTxtFileUnderKey(key);
        Double amount = Double.parseDouble(amountString);
        Double plusAmount = Double.parseDouble(plusAmountString);
        Double amountToEnter = amount + plusAmount;
        String xPathForInputFieldForAmount = "//nlb-input-amount-currency-with-dropdown//input";
        WebElement elementForInputFieldForAmount = SelectByXpath.CreateElementByXpath(xPathForInputFieldForAmount);
        hp.EnterTextToElement(elementForInputFieldForAmount, amountToEnter.toString());
    }

    @And("Check if authorization is needed and complete payment with account iban from Excel {string} columnName {string} with message {string}")
    public void checkIfAuthorizationIsNeededAndCompletePaymentWithAccountIbanFromExcelColumnNameWithMessage(String rowindex, String columnName, String notifMessage) throws Throwable {
        rh.checkIfAuthIsNeededAndCompletePaymentFor(rowindex, columnName, notifMessage);
    }

    @And("Assert element by tag {string} index {string} has {string} {string}")
    public void assertElementByTagIndexHas(String tag, String index, String attribute, String expectedText) throws Throwable {
        String xPath = "//" + tag + "[" + index + "]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String actualText = element.getAttribute(attribute);
        assertEquals(expectedText, actualText);
    }

    @And("Assert element by label contains text {string} with following sibling {string} that has descendant {string} has text from Excel {string} columnName {string} with no spaces")
    public void assertElementByLabelContainsTextWithFollowingSiblingThatHasDescendantHasTextFromExcelColumnNameWithNoSpaces(String labelText, String siblingTag, String descendantTag, String rowindex, String columnName) throws Throwable {
        String stringForExpectedValue = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPathForAssertElement = "//label[contains(text(),'" + labelText + "')]//following-sibling::" + siblingTag + "//" + descendantTag + "";
        WebElement elementForAssert = SelectByXpath.CreateElementByXpath(xPathForAssertElement);
        String actualValue = elementForAssert.getAttribute("value");
        String actualValueTrim = actualValue.replace(" ", "");
        String expectedValue = stringForExpectedValue.replace(" ", "");
        assertEquals(expectedValue, actualValueTrim);
    }

    @And("Click on element by tag {string} and text {string}")
    public void clickOnElementByTagAndText(String tag, String text) throws Throwable {
        WebElement element = SelectByTagName.CreateElementByTextAndTag(tag, text);
        hp.ClickOnElement(element);
    }

    @And("Enter amount {string} larger than amount under key {string} into amount input field in Pay or Transfer screen")
    public void enterAmountLargerThanAmountUnderKeyIntoAmountInputFieldInPayOrTransferScreen(String stringAddition, String key) throws Throwable {
        Double addition = Double.parseDouble(stringAddition);
        String stringAvailableBalance = Utilities.getDataFromTxtFileUnderKey(key);
        Double availableBalance = Double.parseDouble(stringAvailableBalance);
        Double add = addition + availableBalance;
        String addString = add.toString();
        String xPathForInputFieldForAmount = "//nlb-input-amount-currency-with-dropdown//input";
        WebElement elementForInputFieldForAmount = SelectByXpath.CreateElementByXpath(xPathForInputFieldForAmount);
        hp.EnterTextToElement(elementForInputFieldForAmount, addString);
    }

    @And("Assert that transaction {string} in opened past payment contains text from Excel {string} columnName {string}")
    public void assertThatTransactionInOpenedPastPaymentContainsTextFromExcelColumnName(String text, String rowindex, String columnName) throws Throwable {
        String stringForExpectedValue = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPathForDataCheck = "(//*[text()='" + text + "']//following-sibling::div)[2]";
        WebElement elementForDataCheck = SelectByXpath.CreateElementByXpath(xPathForDataCheck);
        assertTrue(elementForDataCheck.getAttribute("textContent").contains(stringForExpectedValue));
    }

    @And("Assert {string} in payment review contains text from excel {string} columnName {string}")
    public void assertInPaymentReviewContainsTextFromExcelColumnName(String text, String rowindex, String columnName) throws Throwable {
        String expectedValue = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPathForElementAssert = "//*[contains(text(),'" + text + "')]//following-sibling::*";
        WebElement elementForAssert = SelectByXpath.CreateElementByXpath(xPathForElementAssert);
        assertTrue(elementForAssert.getAttribute("textContent").contains(expectedValue));
    }

    @And("Assert that product iban from Excel {string} columnName {string} does not contain currency {string} in address book for first step of payment")
    public void assertThatProductIbanFromExcelColumnNameDoesNotContainCurrencyInAddressBookForFirstStepOfPayment(String rowindex, String columnName, String notAllowedCurrency) throws Throwable {
        String accountIban = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPath = "//*[contains(text(),'" + accountIban + "')]/ancestor::div[1]/following-sibling::div";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertFalse(element.getAttribute("innerText").contains(notAllowedCurrency));
    }

    @And("Assert element by contains text {string} has attribute {string} with value {string}")
    public void assertElementByContainsTextHasAttributeWithValue(String text, String attribute, String expectedValue) throws Throwable {
        WebElement element = SelectByText.CreateElementByXpathContainingText(text);
        String actualValue = element.getAttribute(attribute);
        assertEquals(expectedValue, actualValue);
    }

    @Then("Assert {string} in product details page is displayed with index {int}")
    public void assertInProductDetailsPageIsDisplayedWithIndex(String expectedText, int index) throws Throwable {
        String xPath = "//nlb-selected-product-details/div/nlb-product-details-card[" + index + "]/div/div/div[1]/nlb-heading-text[2]/h3";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
        assertEquals(expectedText, element.getAttribute("innerText"));
    }

    @And("Assert Overdraft interest rate is displayed correctly in Financial details for Current account")
    public void assertOverdraftInterestRateIsDisplayedCorrectlyInFinancialDetailsForCurrentAccount() throws Throwable {
        //interest rate title
        String IRxPath = "//h3[contains(text(), 'Financial details')]/ancestor::div[1]/following-sibling::dl[1]/div[4]/dt/div";
        WebElement IRElement = SelectByXpath.CreateElementByXpath(IRxPath);
        assertTrue(IRElement.isDisplayed());
        assertEquals("Overdraft Interest rate", IRElement.getAttribute("innerText"));
        //interest rate amount in %
        String amountxPath = "//h3[contains(text(), 'Financial details')]/ancestor::div[1]/following-sibling::dl[1]/div[4]/dd/div";
        WebElement amountElement = SelectByXpath.CreateElementByXpath(amountxPath);
        assertTrue(amountElement.isDisplayed());
        assertTrue(amountElement.getAttribute("innerText").matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{4}[%]{1}"));
    }

    @And("Assert Unauthorized overdraft Interest rate is displayed correctly in Financial details for Current account")
    public void assertUnauthorizedOverdraftInterestRateIsDisplayedCorrectlyInFinancialDetailsForCurrentAccount() throws Throwable {
        //interest rate title
        String IRxPath = "//h3[contains(text(), 'Financial details')]/ancestor::div[1]/following-sibling::dl[1]/div[5]/dt/div";
        WebElement IRElement = SelectByXpath.CreateElementByXpath(IRxPath);
        assertTrue(IRElement.isDisplayed());
        assertEquals("Unauthorized overdraft Interest rate", IRElement.getAttribute("innerText"));
        //interest rate amount in %
        String amountxPath = "//h3[contains(text(), 'Financial details')]/ancestor::div[1]/following-sibling::dl[1]/div[3]/dd/div";
        WebElement amountElement = SelectByXpath.CreateElementByXpath(amountxPath);
        assertTrue(amountElement.isDisplayed());
        assertTrue(amountElement.getAttribute("innerText").matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{4}[%]{1}"));
    }

    @And("Assert Account type is displayed correctly in Account details for Current account")
    public void assertAccountTypeIsDisplayedCorrectlyInAccountDetailsForCurrentAccount() throws Throwable {
        String currentEnv = DataManager.getDataFromHashDatamap("1", "currentEnv");
        if (currentEnv.equals("uat")){
            //account type title
            //String titlexPath = "//h3[contains(text(), 'Account details')]/ancestor::div[1]/following-sibling::div[1]/div[1]/div[1]";
            String titlexPath = "//*[@id=\"tabpanel-3\"]/section/nlb-selected-product-details/div/nlb-product-details-card[3]/div/div/dl/div[1]/dt/div";
            WebElement titleElement = SelectByXpath.CreateElementByXpath(titlexPath);
            assertTrue(titleElement.isDisplayed());
            assertEquals("Account type", titleElement.getAttribute("innerText"));
            //account type value
            //String ATxPath = "//h3[contains(text(), 'Account details')]/ancestor::div[1]/following-sibling::div[1]/div[1]/div[2]/div";
            String ATxPath = "//*[@id=\"tabpanel-3\"]/section/nlb-selected-product-details/div/nlb-product-details-card[3]/div/div/dl/div[1]/dd/div";
            WebElement ATElement = SelectByXpath.CreateElementByXpath(ATxPath);
            assertTrue(ATElement.isDisplayed());
            assertEquals("Current account", ATElement.getAttribute("innerText"));
        }
        if (currentEnv.equals("tst")){
            //account type title
            String titlexPath = "//nlb-product-details-card[3]/div/div/dl/div[1]/dt/div";
            WebElement titleElement = SelectByXpath.CreateElementByXpath(titlexPath);
            assertTrue(titleElement.isDisplayed());
            assertEquals("Account type", titleElement.getAttribute("innerText"));
            //account type value
            String ATxPath = "//nlb-product-details-card[3]/div/div/dl/div[1]/dd/div";
            WebElement ATElement = SelectByXpath.CreateElementByXpath(ATxPath);
            assertTrue(ATElement.isDisplayed());
            assertEquals("Current account", ATElement.getAttribute("innerText"));
        }
    }

    @And("Assert BIC in Account details is {string}")
    public void assertBICInAccountDetailsIs(String expectedText) throws Throwable {
        String currentEnv = DataManager.getDataFromHashDatamap("1", "currentEnv");
        if (currentEnv.equals("uat")){
            //String xPath = "//*[contains(text(),'BIC')]/ancestor::div[2]//following-sibling::div[1]";
            String xPath = "//nlb-product-details-card[3]/div/div/dl/div[4]/dd/div";
            WebElement element = SelectByXpath.CreateElementByXpath(xPath);
            assertEquals(expectedText, element.getAttribute("textContent"));
        }
        if (currentEnv.equals("tst")){
            String xPath = "//nlb-product-details-card[3]/div/div/dl/div[4]/dd/div";
            WebElement element = SelectByXpath.CreateElementByXpath(xPath);
            assertEquals(expectedText, element.getAttribute("textContent"));
        }
    }

    @And("Assert content in clipboard is from Excel {string} columnName {string}")
    public void assertContentInClipboardIsFromExcelColumnName(String rowindex, String columnName) throws IOException, UnsupportedFlavorException {
        String expectedText = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String actualText = RoutineHelper.getTextFromClipboard();
        assertEquals(expectedText, actualText);
    }

    @And("Assert {string} in Account details is {string}")
    public void assertInAccountDetailsIs(String text, String expectedText) throws Throwable {
        String currentEnv = DataManager.getDataFromHashDatamap("1", "currentEnv");
        if (currentEnv.equals("uat")){
            String xPath = "(//*[contains(text(),'"+text+"')]/ancestor::dt[1]//following-sibling::dd[1]/div)[1]";
            WebElement element = SelectByXpath.CreateElementByXpath(xPath);
            assertEquals(expectedText, element.getAttribute("textContent"));
        }
        if (currentEnv.equals("tst")){
            String xPath = "(//*[contains(text(),'"+text+"')]/ancestor::dt[1]//following-sibling::dd[1]/div)[1]";
            WebElement element = SelectByXpath.CreateElementByXpath(xPath);
            assertEquals(expectedText, element.getAttribute("textContent"));
        }
    }

    @And("Assert Financial detail {string} has value with two decimal places and ends in {string}")
    public void assertFinancialDetailHasValueWithTwoDecimalPlacesAndEndsIn(String text, String ends) throws Throwable {
        String xPath = "//*[text()='" + text + "']/ancestor::dt[1]/following-sibling::dd";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String actualValue = element.getAttribute("textContent");
        assertTrue(actualValue.matches("^\\d{1,3}(\\.\\d{3})*,\\d{2}\\s*EUR$"));
    }

    @And("Assert Financial detail {string} has value {string} in attribute {string}")
    public void assertFinancialDetailHasValueInAttribute(String text, String expectedValue, String attribute) throws Throwable {
        String xPath = "//*[text()='" + text + "']/ancestor::dt[1]/following-sibling::dd";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String actualValue = element.getAttribute(attribute);
        assertEquals(expectedValue, actualValue);
    }

    @And("Assert Financial detail {string} has value from Excel {string} columnName {string} in attribute {string}")
    public void assertFinancialDetailHasValueFromExcelColumnNameInAttribute(String text, String rowindex, String columnName, String attribute) throws Throwable {
        String expectedValue = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPath = "//*[text()='" + text + "']/ancestor::dt[1]/following-sibling::dd";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String actualValue = element.getAttribute(attribute);
        assertEquals(expectedValue, actualValue);
    }

    @And("Click to show transactions of foreign {string} currency in my product")
    public void clickToShowTransactionsOfForeignCurrencyInMyProduct(String currency) throws Throwable {
        List<WebElement> webElementList = SelectByXpath.CreateElementsByXpath("//nlb-account-balance-card");
        for (WebElement element : webElementList) {
            if (element.getAttribute("textContent").contains(currency)) {
                hp.ClickOnElement(element);
            }
        }
    }

    @And("Assert element by tag {string} contains class {string}")
    public void assertElementByTagContainsClass(String tag, String containsClass) throws Throwable {
        WebElement element = SelectByXpath.CreateElementByXPathTagContainsClass(tag, containsClass);
        assertTrue(element.isDisplayed());
    }

    @And("Assert element by tag {string} with descendant tag {string} that contains class {string}")
    public void assertElementByTagWithDescendantTagThatContainsClass(String tagAncestor, String tagDescendant, String containsClass) throws Throwable {
        String xPath = "//" + tagAncestor + "//" + tagDescendant + "[contains(@class,'" + containsClass + "')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
    }

    @And("Assert label name for transaction detail {string} in opened transaction")
    public void assertLabelNameForTransactionDetailInOpenedTransaction(String text) throws Throwable {
        String xPath = "(//nlb-transaction-card[.//*[@role='button' and @aria-expanded='true']]   //*[@id='accordion-content']//dt[normalize-space(.)='"+text+"'])[last()]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
    }

    @And("Remember all available currencies for opened account under key {string}")
    public void rememberAllAvailableCurrenciesForOpenedAccountUnderKey(String key) throws Throwable {
        String xPath = "//nlb-account-balance-card";
        List<WebElement> webElementList = SelectByXpath.CreateElementsByXpath(xPath);
        String finalniSet = new String();
        for (WebElement element : webElementList) {
            String input = element.getAttribute("textContent");
            Set<String> uppercaseWords = new HashSet<>();
            String[] words = input.split("\\s+");
            for (String word : words) {
                // Check if the word has exactly 3 uppercase letters
                if (word.matches("[A-Z]{3}")) {
                    uppercaseWords.add(word);
                }
            }
            String result = String.join(" ", uppercaseWords);
            finalniSet += result + " ";
        }
        finalniSet = finalniSet.trim();

        String[] words = finalniSet.split("\\s+");
        LinkedHashSet<String> uniqueWords = new LinkedHashSet<>();
        for (String word : words) {
            uniqueWords.add(word);
        }
        String result = String.join(" ", uniqueWords);
        System.out.println(result);
        DataManager.userObject.put(key, result);
    }

    @And("Assert From currencies in currency exchange are from key {string}")
    public void assertFromCurrenciesInCurrencyExchangeAreFromKey(String key) throws Throwable {
        String expectedCurrenciesFromKey = (String) DataManager.userObject.get(key);
        String expectedCurrencies = rh.sortWordsInStringInAlphabetical(expectedCurrenciesFromKey);
        String xPath = "(//*[contains(@class,'dropdownList')])[1]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String actualCurrencies = element.getAttribute("outerText");
        actualCurrencies = actualCurrencies.replace("\n", " ");
        assertEquals(expectedCurrencies, actualCurrencies);
    }

    @And("Click on From currencies dropdown in currency exchange")
    public void clickOnFromCurrenciesDropdownInCurrencyExchange() throws Throwable {
        String xPath = "(//*[contains(@class,'icon-chevron-down')])[1]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        hp.ClickOnElement(element);
        WaitHelpers.waitForSeconds(3);
    }

    @And("Select currency {string} in currency dropdown in currency exchange and remember it under key {string}")
    public void selectCurrencyInCurrencyDropdownInCurrencyExchangeAndRememberItUnderKey(String currency, String key) throws Throwable {
        String xPath = "//*[contains(@class,'dropdown')]//*[text()='" + currency + "']";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        hp.ClickOnElement(element);
        DataManager.userObject.put(key, currency);
        WaitHelpers.waitForSeconds(3);
    }

    @And("Enter text {string} into {string} field in currency exchange screen")
    public void enterTextIntoFieldInCurrencyExchangeScreen(String textToEnter, String textToCheck) throws Throwable {
        if (textToCheck.equals("I wish to exchange")) {
            String xPath = "(//input)[1]";
            WebElement element = SelectByXpath.CreateElementByXpath(xPath);
            hp.EnterTextToElement(element, textToEnter);
        }
        if (textToCheck.equals("To currency")) {
            String xPath = "(//input)[2]";
            WebElement element = SelectByXpath.CreateElementByXpath(xPath);
            hp.EnterTextToElement(element, textToEnter);
        }
    }

    @And("Assert To currencies in currency exchange are all shown except currency under key {string}")
    public void assertToCurrenciesInCurrencyExchangeAreAllShownExceptCurrencyUnderKey(String key) throws Throwable {
        String excludedCurrency = (String) DataManager.userObject.get(key);
        String expectedCurrencyList = rh.returnAllCurenciesExcept(excludedCurrency);
        String xPath = "(//*[contains(@class,'dropdownList')])[2]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String actualCurrencyList = element.getAttribute("textContent");
        assertEquals(expectedCurrencyList, actualCurrencyList);
    }

    @And("Click on To currencies dropdown in currency exchange")
    public void clickOnToCurrenciesDropdownInCurrencyExchange() throws Throwable {
        String xPath = "(//*[contains(@class,'icon-chevron-down')])[2]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Remember {string} currency rate for country {string} under key {string}")
    public void rememberCurrencyRateForCountryUnderKey(String rateType, String country, String key) throws Throwable {
        if (rateType.equals("sell")) {
            String xPath = "//span[text()='" + country + "']/ancestor::td/following-sibling::td[2]";
            WebElement element = SelectByXpath.CreateElementByXpath(xPath);
            String value = element.getAttribute("innerText");
            DataManager.userObject.put(key, value);
        }
        if (rateType.equals("buy")) {
            String xPath = "//span[text()='" + country + "']/ancestor::td/following-sibling::td[1]";
            WebElement element = SelectByXpath.CreateElementByXpath(xPath);
            String value = element.getAttribute("innerText");
            DataManager.userObject.put(key, value);
            WaitHelpers.waitForSeconds(3);
        }
    }

    @And("For currency exchange rate {string} and source amount {string} calculate destination amount")
    public void forCurrencyExchangeRateAndSourceAmountCalculateDestinationAmount(String sellKey, String sourceAmountString) throws Throwable {
        String sellExchangeRateString = (String) DataManager.userObject.get(sellKey);
        sellExchangeRateString = sellExchangeRateString.replace(",", ".");
        Double sourceAmount = Double.parseDouble(sourceAmountString);
        Double sellExchangeRate = Double.parseDouble(sellExchangeRateString);
        Double destinationAmount = sourceAmount * sellExchangeRate;

        Double roundedValue = Math.round(destinationAmount * 100.0) / 100.0;
        //BigDecimal roundedValue3 = new BigDecimal(destinationAmount).setScale(2, RoundingMode.HALF_DOWN);
        //Double roundedValue = roundedValue3.doubleValue();
        DecimalFormat decimalFormat = new DecimalFormat("#.00");
        String expectedValue = decimalFormat.format(roundedValue);
        expectedValue = expectedValue.replace(".", ",");
        DataManager.userObject.put("destination_amount", expectedValue);

        String xPath = "(//input)[2]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String actualValue = element.getAttribute("value");

        //Assert.assertEquals(String.format("%.2f", expectedValueFinal),String.format("%.2f", actualValueFinal));
        System.out.println(expectedValue);
        System.out.println(actualValue);
        assertTrue(actualValue.contains(expectedValue.substring(0, 4)));
    }

    @And("Assert I Wish to Exchange in currency exchange review has value of {string}")
    public void assertIWishToExchangeInCurrencyExchangeReviewHasValueOf(String expectedValue) throws Throwable {
        String xPath = "(//div[contains(text(),'I wish to exchange')]/ancestor::nlb-heading-text/following-sibling::nlb-heading-text)[2]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String actualValue = element.getAttribute("textContent");
        assertEquals(expectedValue, actualValue);
    }

    @And("Assert To currency in currency exchange review has value from key {string} and currency {string}")
    public void assertToCurrencyInCurrencyExchangeReviewHasValueFromKeyAndCurrency(String key, String currency) throws Throwable {
        String expectedValue = (String) DataManager.userObject.get(key);

        expectedValue = expectedValue.replace(",", ".");
        Double expectedValueDouble = Double.parseDouble(expectedValue);
        String expectedValueSecond = String.format("%.2f", expectedValueDouble);
        expectedValueSecond = expectedValueSecond.replace(".", ",");

        expectedValue = expectedValueSecond + " " + currency;
        String xPath = "(//div[contains(text(),'To currency')]/ancestor::nlb-heading-text/following-sibling::nlb-heading-text)[2]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String actualValue = element.getAttribute("textContent");
        assertEquals(expectedValue, actualValue);

    }

    @And("Assert {string} in currency exchange review is from Excel {string} columnName {string}")
    public void assertInCurrencyExchangeReviewIsFromExcelColumnName(String text, String rowindex, String columnName) throws Throwable {
        String expected = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPath = "//*[contains(text(),'" + text + "')]/following-sibling::*";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String actual = element.getAttribute("innerText");
        assertTrue(actual.contains(expected));
    }

    @And("Assert {string} in currency exchange review has current date")
    public void assertInCurrencyExchangeReviewHasCurrentDate(String text) throws Throwable {
        String xPath = "//*[contains(text(),'" + text + "')]/following-sibling::*";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String actual = element.getAttribute("innerText");
        String expected = rh.todayDate();
        assertEquals(expected, actual);
    }

    @And("Assert that transaction date for first transaction in product screen is today date")
    public void assertThatTransactionDateForFirstTransactionInProductScreenIsTodayDate() throws Throwable {
        String xPath = "(//*[contains(@class,'caption medium tw-flex tw-items-center tw-text-gray-400')])[1]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String actual = element.getAttribute("textContent");
        String expected = rh.todayDate();
        assertTrue(actual.contains(expected));
    }

    @And("Assert that purpose for first transaction in product screen is for currency exchange")
    public void assertThatPurposeForFirstTransactionInProductScreenIsForCurrencyExchange() throws Throwable {
        String expected = "MENJAVA VALUTE";
        String xPath = "(//*[contains(@class,'medium tw-text-gray-100')])[1]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String actual = element.getAttribute("innerText");
        assertEquals(expected, actual);
    }

    @And("Assert that purpose for first transaction in product screen is for transaction from key {string}")
    public void assertThatPurposeForFirstTransactionInProductScreenIsForTransactionFromKey(String key) throws Throwable {
        String expected = Utilities.getDataFromTxtFileUnderKey(key);
        String xPath = "(//*[contains(@class,'medium tw-text-gray-100')])[1]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String actual = element.getAttribute("innerText");
        assertEquals(expected, actual);
    }

    @And("Assert that creditor for first transaction in product screen is from Excel {string} columnName {string}")
    public void assertThatCreditorForFirstTransactionInProductScreenIsFromExcelColumnName(String rowindex, String columnName) throws Throwable {
        String expected = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPath = "(//*[contains(@class,'caption medium tw-text-gray-400 xs:subheadline')])[1]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String actual = element.getAttribute("innerText");
        assertTrue(actual.contains(expected));
    }

    @And("Assert that amount for first transaction in product screen is {string}")
    public void assertThatAmountForFirstTransactionInProductScreenIs(String expected) throws Throwable {
        String xPath = "(//nlb-selected-product-transactions//nlb-amount)[2]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String actual = element.getAttribute("textContent");
        assertTrue(actual.contains(expected));
    }

    @And("Assert that currency for first transaction in product screen is {string}")
    public void assertThatCurrencyForFirstTransactionInProductScreenIs(String expected) throws Throwable {
        String xPath = "(//nlb-selected-product-transactions//nlb-amount)[2]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String actual = element.getAttribute("textContent");
        assertTrue(actual.contains(expected));
    }

    @And("Assert that creditor for opened transaction in product screen is from Excel {string} columnName {string}")
    public void assertThatCreditorForOpenedTransactionInProductScreenIsFromExcelColumnName(String rowindex, String columnName) throws Throwable {
        String expected = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPath = "(//*[not(contains(@class,'xs:tw-hidden'))]/*[text()='Name and address']/following-sibling::*)[2]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String actual = element.getAttribute("textContent");
        actual = actual.replace(" ", "");
        expected = expected.replace(" ", "");
        System.out.println(expected);
        System.out.println(actual);
        assertTrue(actual.contains(expected));
    }

    @And("Assert that creditor account number for opened transaction in product screen is from Excel {string} columnName {string}")
    public void assertThatCreditorAccountNumberForOpenedTransactionInProductScreenIsFromExcelColumnName(String rowindex, String columnName) throws Throwable {
        String expected = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPath = "(//*[not(contains(@class,'xs:tw-hidden'))]/*[text()='Account number']/following-sibling::*)[2]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String actual = element.getAttribute("textContent");
        assertTrue(actual.contains(expected));
    }

    @And("Assert that settlement date for opened transaction in product screen is today date")
    public void assertThatSettlementDateForOpenedTransactionInProductScreenIsTodayDate() throws Throwable {
        String expected = rh.todayDate();
        String xPath = "(//*[not(contains(@class,'xs:tw-hidden'))]/*[text()='Settlement date']/following-sibling::*)[2]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String actual = element.getAttribute("textContent");
        assertTrue(actual.contains(expected));
    }

    @And("Assert that amount for opened transaction in product screen is from key {string} and currency {string}")
    public void assertThatAmountForOpenedTransactionInProductScreenIsFromKeyAndCurrency(String key, String currency) throws Throwable {
        String destinationAmount = (String) DataManager.userObject.get(key);

        destinationAmount = destinationAmount.replace(",", ".");
        Double expectedValueDouble = Double.parseDouble(destinationAmount);
        String expectedValueSecond = String.format("%.2f", expectedValueDouble);
        expectedValueSecond = expectedValueSecond.replace(".", ",");


        String expected = expectedValueSecond + " " + currency;
        String xPath = "(//div[not(contains(@class,'xs:tw-hidden'))]//*[text()='Amount']/following-sibling::*)[2]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String actual = element.getAttribute("textContent");
        System.out.println(expected);
        System.out.println(actual);
        assertTrue(actual.contains(expected));
    }

    @And("Assert that foreign exchange rate for opened transaction in product screen is formed from {string} {string} key {string} {string}")
    public void assertThatForeignExchangeRateForOpenedTransactionInProductScreenIsFormedFromKey(String compOne, String compTwo, String key, String compFour) throws Throwable {
        String compThree = (String) DataManager.userObject.get(key);
        compThree = compThree.replace(",", ".");
        String expected = compOne + " " + compTwo + " = " + compThree + compFour;
        String xPath = "(//div[not(contains(@class,'xs:tw-hidden'))]//*[text()='Foreign Exchange rate']/following-sibling::*)[2]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String actual = element.getAttribute("textContent");
        assertEquals(expected, actual);
    }

    @And("Assert that transaction id for opened transaction in product screen is not empty")
    public void assertThatTransactionIdForOpenedTransactionInProductScreenIsNotEmpty() throws Throwable {
        String xPath = "(//*[not(contains(@class,'xs:tw-hidden'))]/*[text()='Transaction ID']/following-sibling::*)[2]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.getAttribute("textContent").length() > 3);
    }

    @And("For currency exchange rate {string} and destination amount {string} calculate source amount")
    public void forCurrencyExchangeRateAndDestinationAmountCalculateSourceAmount(String sellKey, String destinationAmountString) throws Throwable {
        String sellExchangeRateString = (String) DataManager.userObject.get(sellKey);
        sellExchangeRateString = sellExchangeRateString.replace(",", ".");
        Double destinationAmount = Double.parseDouble(destinationAmountString);
        Double sellExchangeRate = Double.parseDouble(sellExchangeRateString);
        Double sourceAmount = destinationAmount / sellExchangeRate;
        //String sourceAmountStringCut = sourceAmount.toString();
        //String expectedValue = sourceAmountStringCut.substring(0,4);
        //Double sourceAmountDouble = Double.parseDouble(sourceAmountStringCut);

        Double roundedValue = Math.round(sourceAmount * 100.0) / 100.0;
        //BigDecimal roundedValue3 = new BigDecimal(sourceAmount).setScale(1, RoundingMode.HALF_EVEN);
        //Double roundedValue = roundedValue3.doubleValue();
        DecimalFormat decimalFormat = new DecimalFormat("#.00");
        String expectedValue = decimalFormat.format(roundedValue);

        expectedValue = expectedValue.replace(".", ",");
        DataManager.userObject.put("source_amount", expectedValue);
        String xPath = "(//input)[1]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String actualValue = element.getAttribute("value");
        System.out.println(expectedValue);
        System.out.println(actualValue);
        assertTrue(actualValue.contains(expectedValue.substring(0, 4)));
        //Assert.assertEquals(expectedValue,actualValue);
    }

    @And("Assert I Wish to Exchange in currency exchange review has value from key {string} and currency {string}")
    public void assertIWishToExchangeInCurrencyExchangeReviewHasValueFromKeyAndCurrency(String key, String currency) throws Throwable {
        String xPath = "//div[contains(text(),'I wish to exchange')]/ancestor::nlb-heading-text/following-sibling::nlb-heading-text";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String actualValue = element.getAttribute("textContent");
        String expectedValue = (String) DataManager.userObject.get(key);
        //expectedValue = expectedValue + " " + currency;
        assertTrue(actualValue.contains(expectedValue));
        assertTrue(actualValue.endsWith(currency));
        //Assert.assertEquals(expectedValue,actualValue);
    }

    @And("Assert To currency in currency exchange review has value of {string}")
    public void assertToCurrencyInCurrencyExchangeReviewHasValueOf(String expectedValue) throws Throwable {
        String xPath = "//div[contains(text(),'To currency')]/ancestor::nlb-heading-text/following-sibling::nlb-heading-text";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String actualValue = element.getAttribute("textContent");
        assertEquals(expectedValue, actualValue);
    }

    @And("Check if authorization is needed and complete payment with account iban from Excel {string} columnName {string} amount from key {string} and currency {string} with message {string}")
    public void checkIfAuthorizationIsNeededAndCompletePaymentWithAccountIbanFromExcelColumnNameAmountFromKeyAndCurrencyWithMessage(String rowindex, String columnName, String key, String currency, String notifMessage) throws Throwable {
        String amount = (String) DataManager.userObject.get(key);
        rh.checkIfAuthIsNeededAndCompletePaymentFor(rowindex, columnName, amount, currency, notifMessage);
    }

    @And("Assert that amount for first transaction in product screen is from key {string}")
    public void assertThatAmountForFirstTransactionInProductScreenIsFromKey(String key) throws Throwable {
        String expected = (String) DataManager.userObject.get(key);
        expected = expected.replace(".", ",");
        String xPath = "(//*//nlb-amount[contains(@class,'tw-text-gray-100')])[1]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String actual = element.getAttribute("textContent");
        System.out.println(expected);
        System.out.println(actual);
        assertTrue(actual.contains(expected));
    }

    @And("Assert that amount for opened transaction in product screen is {string} and currency {string}")
    public void assertThatAmountForOpenedTransactionInProductScreenIsAndCurrency(String destinationAmount, String currency) throws Throwable {
        String expected = destinationAmount + " " + currency;
        String xPath = "//div[not(contains(@class,'xs:tw-hidden'))]/*[text()='Amount']/following-sibling::*";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String actual = element.getAttribute("textContent");
        System.out.println(expected);
        System.out.println(actual);
        assertTrue(actual.contains(expected));
    }

    @And("Wait for currency exchange to appear fixed")
    public void waitForCurrencyExchangeToAppearFixed() {
        WaitHelpers.waitForSeconds(30);
    }

    @Then("Assert that product card of name {string} and iban {string} from Excel {string} for credit card account are shown correctly")
    public void assertThatProductCardOfNameAndIbanFromExcelForCreditCardAccountAreShownCorrectly(String columnName1, String columnName2, String rowindex) throws Throwable {
        String productName = DataManager.getDataFromHashDatamap(rowindex, columnName1);
        String productIban = DataManager.getDataFromHashDatamap(rowindex, columnName2);
        String xPathForProductCard1 = "//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//*[contains(text(),'Available balance')]";
        String xPathForCurrentBalance = "(//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//nlb-heading-text//span[1])[1]";
        String xPathForCurrentBalanceCurrency = "(//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//nlb-heading-text//span[2])[1]";

        WebElement elementForProductCard1 = SelectByXpath.CreateElementByXpath(xPathForProductCard1);
        assertTrue(elementForProductCard1.isDisplayed());
        WebElement elementForCurrentBalance = SelectByXpath.CreateElementByXpath(xPathForCurrentBalance);
        String stringCurrentBalance = elementForCurrentBalance.getAttribute("innerText");
        assertTrue(stringCurrentBalance.matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{2}"));
        WebElement elementForCurrentBalanceCurrency = SelectByXpath.CreateElementByXpath(xPathForCurrentBalanceCurrency);
        String stringCurrentBalanceCurrency = elementForCurrentBalanceCurrency.getAttribute("innerText");
        assertTrue(stringCurrentBalanceCurrency.contains("EUR"));
    }

    @And("Assert that whole product card of credit card account with name {string} and iban {string} from Excel {string} acts as a clickable button")
    public void assertThatWholeProductCardOfCreditCardAccountWithNameAndIbanFromExcelActsAsAClickableButton(String columnName1, String columnName2, String rowindex) throws Throwable {
        String productName = DataManager.getDataFromHashDatamap(rowindex, columnName1);
        String productIban = DataManager.getDataFromHashDatamap(rowindex, columnName2);

        String xPathForProductName = "(//nlb-product-card//*[contains(text(),'" + productName + "')])[1]";
        String xPathForProductIban = "//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]";
        String xPathForCurrentBalance = "//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//*[contains(text(),'Available balance')]";
        String xPathForCurrentBalanceAmount = "(//nlb-product-card//*[contains(text(),'" + productName + "')]//ancestor::nlb-product-card//*[contains(text(),'" + productIban + "')]//ancestor::nlb-product-card//nlb-heading-text//span[1])[1]";

        WebElement elementForProductName = SelectByXpath.CreateElementByXpath(xPathForProductName);
        hp.ClickOnElement(elementForProductName);
        By elPhotoHeader1 = SelectByClassName.CreateByElementByContainsClassName("tw-bg-nlb-omnichannel-photo-header");
        WaitHelpers.WaitForElement(elPhotoHeader1);
        WebElement elementForPhotoHeader1 = SelectByXpath.CreateElementBy(elPhotoHeader1);
        assertTrue(elementForPhotoHeader1.isDisplayed());
        driver.navigate().back();

        By elForProductIban = SelectByXpath.CreateByElementByXpath(xPathForProductIban);
        WaitHelpers.WaitForElement(elForProductIban);
        WebElement elementForProductIban = SelectByXpath.CreateElementBy(elForProductIban);
        JSHelpers.ScrollIntoViewBottom(elementForProductIban);
        hp.ClickOnElement(elementForProductIban);
        By elPhotoHeader2 = SelectByClassName.CreateByElementByContainsClassName("tw-bg-nlb-omnichannel-photo-header");
        WaitHelpers.WaitForElement(elPhotoHeader2);
        WebElement elementForPhotoHeader2 = SelectByXpath.CreateElementBy(elPhotoHeader2);
        assertTrue(elementForPhotoHeader2.isDisplayed());
        driver.navigate().back();

        By elForCurrentBalance = SelectByXpath.CreateByElementByXpath(xPathForCurrentBalance);
        WaitHelpers.WaitForElement(elForCurrentBalance);
        WebElement elementForCurrentBalance = SelectByXpath.CreateElementBy(elForCurrentBalance);
        JSHelpers.ScrollIntoViewBottom(elementForCurrentBalance);
        hp.ClickOnElement(elementForCurrentBalance);
        By elPhotoHeader3 = SelectByClassName.CreateByElementByContainsClassName("tw-bg-nlb-omnichannel-photo-header");
        WaitHelpers.WaitForElement(elPhotoHeader3);
        WebElement elementForPhotoHeader3 = SelectByXpath.CreateElementBy(elPhotoHeader3);
        assertTrue(elementForPhotoHeader3.isDisplayed());
        driver.navigate().back();

        By elForCurrentBalanceAmount = SelectByXpath.CreateByElementByXpath(xPathForCurrentBalanceAmount);
        WaitHelpers.WaitForElement(elForCurrentBalanceAmount);
        WebElement elementForCurrentBalanceAmount = SelectByXpath.CreateElementBy(elForCurrentBalanceAmount);
        JSHelpers.ScrollIntoViewBottom(elementForCurrentBalanceAmount);
        hp.ClickOnElement(elementForCurrentBalanceAmount);
        By elPhotoHeader5 = SelectByClassName.CreateByElementByContainsClassName("tw-bg-nlb-omnichannel-photo-header");
        WaitHelpers.WaitForElement(elPhotoHeader5);
        WebElement elementForPhotoHeader5 = SelectByXpath.CreateElementBy(elPhotoHeader5);
        assertTrue(elementForPhotoHeader5.isDisplayed());
        driver.navigate().back();

    }

    @And("Assert Lock card switch is unchecked")
    public void assertLockCardSwitchIsUnchecked() throws Throwable {
        String xPath = "(//*[@type='checkbox'])[1]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertFalse(element.isSelected());
    }

    @And("Assert ATM withdrawals switch is checked")
    public void assertATMWithdrawalsSwitchIsChecked() throws Throwable {
        String xPath = "(//*[@type='checkbox'])[2]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isSelected());
    }

    @And("Assert Online payments switch is checked")
    public void assertOnlinePaymentsSwitchIsChecked() throws Throwable {
        String xPath = "(//*[@type='checkbox'])[3]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isSelected());
    }

    @And("Assert Payments abroad switch is checked")
    public void assertPaymentsAbroadSwitchIsChecked() throws Throwable {
        String xPath = "(//*[@type='checkbox'])[4]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isSelected());
    }

    @And("Click on Lock card switch")
    public void clickOnLockCardSwitch() throws Throwable {
        String xPath = "(//nlb-toggle-button-ios)[1]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Assert Lock card switch is checked")
    public void assertLockCardSwitchIsChecked() throws Throwable {
        String xPath = "(//*[@type='checkbox'])[1]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isSelected());
    }

    @And("Assert ATM withdrawals switch is unchecked")
    public void assertATMWithdrawalsSwitchIsUnchecked() throws Throwable {
        String xPath = "(//*[@type='checkbox'])[2]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertFalse(element.isSelected());
    }

    @And("Assert Online payments switch is unchecked")
    public void assertOnlinePaymentsSwitchIsUnchecked() throws Throwable {
        String xPath = "(//*[@type='checkbox'])[3]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertFalse(element.isSelected());
    }

    @And("Assert Payments abroad switch is unchecked")
    public void assertPaymentsAbroadSwitchIsUnchecked() throws Throwable {
        String xPath = "(//*[@type='checkbox'])[4]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertFalse(element.isSelected());
    }

    @Then("Assert {string} in the top of Payments screen")
    public void assertInTheTopOfPaymentsScreen(String text) throws Throwable {
        String xPath = "//*[contains(@class,'tw-flex tw-flex-w')]//*[contains(text(),'" + text + "')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
    }

    @And("Enter text {string} into input field")
    public void enterTextIntoInputField(String searchValue) throws Throwable {
        String xPath = "//input";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        hp.EnterTextToElement(element, searchValue);
    }

    @And("Calculate the sum of all categories in Spending tab for current month")
    public void calculateTheSumOfAllCategoriesInSpendingTabForCurrentMonth() throws Throwable {
        String xPath = "//*[@class='tw-pt-2 xl:tw-pt-6']/div//nlb-amount//span[1]";
        List<WebElement> webElementList = SelectByXpath.CreateElementsByXpath(xPath);
        Double sum = 0.0;
        for (WebElement element : webElementList) {
            String textContent = element.getAttribute("textContent");
            textContent = textContent.replace(".", "");
            textContent = textContent.replace(",", ".");
            Double number = Double.parseDouble(textContent);
            sum = sum + number;
        }
        sum = Math.round(sum * 100.0) / 100.0;
        System.out.println(sum);
        DataManager.userObject.put("sum", sum);
    }

    @And("Assert Total income for Spending tab in current month is from key {string}")
    public void assertTotalIncomeForSpendingTabInCurrentMonthIsFromKey(String key) throws Throwable {
        String xPath = "//nlb-pie-chart//h3";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String textContent = element.getAttribute("textContent");
        textContent = textContent.replace("EUR", "");
        textContent = textContent.replace(".", "");
        textContent = textContent.replace(",", ".");
        Double expectedDouble = (Double) DataManager.userObject.get(key);
        String expected = expectedDouble.toString();
        Assert.assertTrue(textContent.contains(expected));
    }

    @And("Remember amount for {string} in Spending tab of current month under key {string}")
    public void rememberAmountForInSpendingTabOfCurrentMonthUnderKey(String text, String key) throws Throwable {
        String xPath = "//*[text()='" + text + "']/ancestor::div[1]/following-sibling::div//nlb-amount";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String textContent = element.getAttribute("textContent");
        textContent = textContent.replace("EUR", "");
        textContent = textContent.replace(".", "");
        textContent = textContent.replace(",", ".");
        System.out.println(textContent);
        DataManager.userObject.put(key, textContent);
    }

    @And("Calculate the sum of all transactions for category from Spending tab")
    public void calculateTheSumOfAllTransactionsForCategoryFromSpendingTab() throws Throwable {
        String xPath = "//h5//nlb-amount";
        List<WebElement> webElementList = SelectByXpath.CreateElementsByXpath(xPath);
        Double sum = 0.0;
        for (WebElement element : webElementList) {
            String textContent = element.getAttribute("textContent");
            textContent = textContent.replace("EUR", "");
            textContent = textContent.replace("−", "");
            textContent = textContent.replace(".", "");
            textContent = textContent.replace(",", ".");
            Double number = Double.parseDouble(textContent);
            sum = sum + number;
        }
        sum = Math.round(sum * 100.0) / 100.0;
        System.out.println(sum);
        DataManager.userObject.put("single_sum", sum);
    }

    @And("Assert that value from key {string} contains value from key {string}")
    public void assertThatValueFromKeyContainsValueFromKey(String key1, String key2) {
        String categorySum = (String) DataManager.userObject.get(key1);
        Double singleSumDouble = (Double) DataManager.userObject.get(key2);
        String singleSum = singleSumDouble.toString();
        System.out.println(categorySum);
        System.out.println(singleSum);
        Assert.assertTrue(categorySum.contains(singleSum));
    }

    @And("Assert Address in Contact data is contains text from Excel {string} columnName {string}")
    public void assertAddressInContactDataIsContainsTextFromExcelColumnName(String rowindex, String columnName) throws Throwable {
        String xPath = "//*[text()='Address']/following-sibling::div";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String textContent = element.getAttribute("textContent");
        String expected = DataManager.getDataFromHashDatamap(rowindex, columnName);
        System.out.println(textContent);
        System.out.println(expected);
        Assert.assertTrue(textContent.contains(expected));
    }

    @And("Assert Swift in Contact data contains text {string}")
    public void assertSwiftInContactDataContainsText(String expectedText) throws Throwable {
        String xPath = "//*[text()='SWIFT (BIC) Code']/following-sibling::div";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String textContent = element.getAttribute("textContent");
        System.out.println(textContent);
        System.out.println(expectedText);
        Assert.assertTrue(textContent.contains(expectedText));
    }

    @And("Assert that amount for opened transaction in product screen is {string} and currency {string} for huf currency")
    public void assertThatAmountForOpenedTransactionInProductScreenIsAndCurrencyForHufCurrency(String destinationAmount, String currency) throws Throwable {
        String expected = destinationAmount + " " + currency;
        String xPath = "//div[not(contains(@class,'xs:tw-hidden'))]/*[text()='Amount']/following-sibling::*";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String actual = element.getAttribute("textContent");
        System.out.println(expected.substring(0, 4));
        System.out.println(actual);
        assertTrue(actual.startsWith(expected.substring(0, 4)));
        assertTrue(actual.endsWith(currency));
    }

    @And("Assert transactions in my product have loaded")
    public void assertTransactionsInMyProductHaveLoaded() throws InterruptedException {
        String xPathForLoadedPayments = "//nlb-transaction-card";
        By elForLoadedPayments = SelectByXpath.CreateByElementByXpath(xPathForLoadedPayments);
        WaitHelpers.WaitForElement(elForLoadedPayments);
    }

    @And("Assert that creditor reference for opened transaction in product screen is {string}")
    public void assertThatCreditorReferenceForOpenedTransactionInProductScreenIs(String expected) throws Throwable {
        String xPath = "(//*[not(contains(@class,'xs:tw-hidden'))]/*[text()='Creditor Reference']/following-sibling::*)[2]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        Assert.assertTrue(element.getAttribute("textContent").contains(expected));
    }


    @And("Click on element by tag {string} and contains text under key {string} from txt file")
    public void clickOnElementByTagAndContainsTextUnderKeyFromTxtFile(String tag, String key) throws Throwable {
        String purpose = Utilities.getDataFromTxtFileUnderKey(key);
        String xPath = "//div[contains(text(),'" + purpose + "')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Assert Address in Contact data contains text {string}")
    public void assertAddressInContactDataContainsText(String expected) throws Throwable {
        String xPath = "//*[text()='Address']/following-sibling::div";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String textContent = element.getAttribute("textContent");
        System.out.println(textContent);
        System.out.println(expected);
        Assert.assertTrue(textContent.contains(expected));
    }

    @And("Assert Bank name in Contact data contains text {string}")
    public void assertBankNameInContactDataContainsText(String expected) throws Throwable {
        String xPath = "//*[text()='Bank name']/following-sibling::div";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String textContent = element.getAttribute("textContent");
        System.out.println(textContent);
        System.out.println(expected);
        Assert.assertTrue(textContent.contains(expected));
    }

    @And("Assert Bank address in Contact data contains text {string}")
    public void assertBankAddressInContactDataContainsText(String expected) throws Throwable {
        String xPath = "//*[text()='Bank address']/following-sibling::div";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String textContent = element.getAttribute("textContent");
        System.out.println(textContent);
        System.out.println(expected);
        Assert.assertTrue(textContent.contains(expected));
    }

    @And("Enter amount {string} into amount input field in second Pay or Transfer screen")
    public void enterAmountIntoAmountInputFieldInSecondPayOrTransferScreen(String textToEnter) throws Throwable {
        String xPath = "//label[contains(text(),'Payment amount')]/following-sibling::div/input[1]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        hp.EnterTextToElement(element, textToEnter);
    }

    @And("Click on repeat payment button for opened past payment")
    public void clickOnRepeatPaymentButtonForOpenedPastPayment() throws Throwable {
        String xPath = "//nlb-payments//button/*[text()='Repeat payment']";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Assert random purpose in purpose field for internal payment in second payment screen is from txt key {string}")
    public void assertRandomPurposeInPurposeFieldForInternalPaymentInSecondPaymentScreenIsFromTxtKey(String key) throws Throwable {
        String xPathForPurposeField = "(//nlb-input-text//input)[1]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPathForPurposeField);
        String actual = element.getAttribute("value");
        String expected = Utilities.getDataFromTxtFileUnderKey(key);
        Assert.assertEquals(expected, actual);
    }

    @And("Remember purpose of all transactions displayed under key {string}")
    public void rememberPurposeOfAllTransactionsDisplayedUnderKey(String key) throws Throwable {
        String xPath = "//h5[contains(@class,'medium tw-text-gray-100')]";
        List<WebElement> webElementList = SelectByXpath.CreateElementsByXpath(xPath);
        List<String> listOfPurpose = new ArrayList<>();
        for (WebElement element : webElementList) {
            listOfPurpose.add(element.getAttribute("innerText"));
        }
        DataManager.userObject.put(key, listOfPurpose);
    }

    @And("Click on category filter button in my product")
    public void clickOnCategoryFilterButtonInMyProduct() throws Throwable {
        String xPath = "//button//*[contains(@class,'icon-finances')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Click on category {string} in category filter")
    public void clickOnCategoryInCategoryFilter(String category) throws Throwable {
        String xPath = "//*[contains(text(),'" + category + "')]/following-sibling::div//nlb-check-box";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Assert list of shown transaction purpose is same as in key {string}")
    public void assertListOfShownTransactionPurposeIsSameAsInKey(String key) throws Throwable {
        List<String> expected = (List<String>) DataManager.userObject.get(key);
        String xPath = "//h5[contains(@class,'medium tw-text-gray-100')]";
        List<WebElement> webElementList = SelectByXpath.CreateElementsByXpath(xPath);
        List<String> listOfPurpose = new ArrayList<>();
        for (WebElement element : webElementList) {
            listOfPurpose.add(element.getAttribute("innerText"));
        }
        Assert.assertEquals(expected, listOfPurpose);
    }

    @And("Assert opened transaction has any category")
    public void assertOpenedTransactionHasAnyCategory() throws Throwable {
        String xPath = "//*[contains(@class,'category-icon-sm')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert that {int} transactions have loaded")
    public void assertThatTransactionsHaveLoaded(int number) throws Throwable {
        String xPath = "//h5[contains(@class,'medium tw-text-gray-100')]";
        List<WebElement> webElementList = SelectByXpath.CreateElementsByXpath(xPath);
        Assert.assertEquals(number, webElementList.size());
    }

    @And("Assert that more than {int} transactions have loaded")
    public void assertThatMoreThanTransactionsHaveLoaded(int number) throws Throwable {
        String xPath = "//h5[contains(@class,'medium tw-text-gray-100')]";
        List<WebElement> webElementList = SelectByXpath.CreateElementsByXpath(xPath);
        Assert.assertTrue(webElementList.size() > number);
    }

    @And("Count the number of loaded payments and put them under key {string}")
    public void countTheNumberOfLoadedPaymentsAndPutThemUnderKey(String key) throws Throwable {
        String xPath = "//h5[contains(@class,'medium tw-text-gray-100')]";
        List<WebElement> webElementList = SelectByXpath.CreateElementsByXpath(xPath);
        DataManager.userObject.put(key, webElementList.size());
    }

    @And("Assert that no more than transactions from key {string} have loaded")
    public void assertThatNoMoreThanTransactionsFromKeyHaveLoaded(String key) throws Throwable {
        String xPath = "//h5[contains(@class,'medium tw-text-gray-100')]";
        List<WebElement> webElementList = SelectByXpath.CreateElementsByXpath(xPath);
        int expected = (int) DataManager.userObject.get(key);
        Assert.assertEquals(expected, webElementList.size());
    }

    @And("Check if total amount for upcoming payments is correct")
    public void checkIfTotalAmountForUpcomingPaymentsIsCorrect() throws Throwable {
        String xPathToCountTotalNumberOfPayments = "//*[contains(@class,'caption medium xs:subheadline tw-text-gray-400')]";
        List<WebElement> webElementList = SelectByXpath.CreateElementsByXpath(xPathToCountTotalNumberOfPayments);
        int numberOfPayments = webElementList.size();

        String xPathForCountedMonth = "(//*[contains(@class,'caption medium xs:subheadline tw-text-gray-400')])[1]";
        WebElement elementForCountedMonth = SelectByXpath.CreateElementByXpath(xPathForCountedMonth);
        String countedMonth = elementForCountedMonth.getAttribute("innerText");
        countedMonth = countedMonth.substring(3, 5);
        Double amount = 0.00;

        for (int i = 1; i <= numberOfPayments; i++) {
            String xPathForMonth = "(//*[contains(@class,'caption medium xs:subheadline tw-text-gray-400')])[" + i + "]";
            WebElement elementForMonth = SelectByXpath.CreateElementByXpath(xPathForMonth);
            String month = elementForMonth.getAttribute("innerText");
            if (month.substring(3, 5).equals(countedMonth)) {
                String xPathForAmount = "(//nlb-payment-item//nlb-amount/div/div[2])[" + i+1 + "]";
                WebElement elementForAmount = SelectByXpath.CreateElementByXpath(xPathForAmount);
                String content = elementForAmount.getAttribute("innerText");
                content = content.replace(".", "");
                content = content.replace(",", ".");
                Double add = Double.parseDouble(content);
                amount = amount + add;
            }
        }
        String xPathForActualAmount = "(//nlb-amount//span)[1]";
        WebElement elementForActualAmount = SelectByXpath.CreateElementByXpath(xPathForActualAmount);
        String actualString = elementForActualAmount.getAttribute("innerText");
        actualString = actualString.replace(".", "");
        actualString = actualString.replace(",", ".");
        Double actual = Double.parseDouble(actualString);

        System.out.println(actual);
        System.out.println(amount);

        Assert.assertEquals(amount, actual);
    }

    @And("Assert that recipient account in second step of payment is from Excel {string} columnName {string}")
    public void assertThatRecipientAccountInSecondStepOfPaymentIsFromExcelColumnName(String rowindex, String columnName) throws Throwable {
        String account = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPath = "(//nlb-account-selector)[2]//*[contains(text(),'" + account + "')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
    }

    @And("Assert amount in second step of payment is from key {string} from txt file")
    public void assertAmountInSecondStepOfPaymentIsFromKeyFromTxtFile(String key) throws Throwable {
        String expectedValue = Utilities.getDataFromTxtFileUnderKey(key).replace(".", ",");
        String xPath = "//*[@nlbamountinput]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String actualValue = element.getAttribute("value");
        Assert.assertEquals(expectedValue, actualValue);
    }

    @And("Assert currency in second step of payment is {string} and read only")
    public void assertCurrencyInSecondStepOfPaymentIsAndReadOnly(String currency) throws Throwable {
        String xPath = "//*[@nlbamountinput]//following-sibling::input[@readonly]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String actualValue = element.getAttribute("value");
        Assert.assertEquals(currency, actualValue);
    }

    @And("Assert GOLOVEC invoice is shown after search and click")
    public void assertGOLOVECInvoiceIsShownAfterSearchAndClick() throws Throwable {
        String xPath = "//*[contains(text(),'ŠPORTNO DRUŠTVO GOLOVEC')]/following-sibling::*[contains(text(),'54827493')]/following-sibling::*[contains(text(),'RUSJANOV TRG 2, 1000 LJUBLJANA, SI')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
        hp.ClickOnElement(element);
    }

    @And("Assert issuer is GOLOVEC in second step of invoice creation")
    public void assertIssuerIsGOLOVECInSecondStepOfInvoiceCreation() throws Throwable {
        String xPath = "//nlb-issuer-selector//*[contains(text(),'ŠPORTNO DRUŠTVO GOLOVEC')]/following-sibling::*[contains(text(),'54827493')]/following-sibling::*[contains(text(),'RUSJANOV TRG 2, 1000 LJUBLJANA, SI')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert element by tag {string} contains text {string} and ancestor tag {string} is disabled")
    public void assertElementByTagContainsTextAndAncestorTagIsDisabled(String tag, String text, String ancestorTag) throws Throwable {
        String xPath = "//" + tag + "[contains(text(),'" + text + "')]/ancestor::" + ancestorTag;
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        Assert.assertEquals("true", element.getAttribute("disabled"));
    }

    @And("Assert pravni dokumneti link for e invoice")
    public void assertPravniDokumnetiLinkForEInvoice() throws Throwable {
        String xPath = "//a[@href='https://www.nlb.si/osebno/pravna-obvestila/pravni-dokumenti' and contains(text(),'Splošnimi pogoji poslovanja z NLB Osebnimi računi')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @Then("Assert shown accounts for invoice debit accounts are correct")
    public void assertShownAccountsForInvoiceDebitAccountsAreCorrect() throws Throwable {
        String xPath = "//*[contains(@class,'tw-max-h-dropdownList')]//*[contains(@class,'tw-max-w-accountItemDescription')]";
        List<WebElement> webElementList = SelectByXpath.CreateElementsByXpath(xPath);
        List<String> listOfIbans = new ArrayList<>();

        for (WebElement element : webElementList) {
            listOfIbans.add(element.getAttribute("innerText"));
        }
        String accountOne = DataManager.getDataFromHashDatamap("1", "personal_account_iban");
        String accountTwo = DataManager.getDataFromHashDatamap("1", "second_personal_account_iban");

        Assert.assertTrue(listOfIbans.contains(accountTwo));
        Assert.assertTrue(listOfIbans.contains(accountOne));
        assertEquals(2, listOfIbans.size());
    }

    @And("Assert there are {int} elements containing class {string}")
    public void assertThereAreElementsContainingClass(int num, String className) throws Throwable {
        List<WebElement> webElementList = SelectByXpath.CreateElementsByXpath("//*[contains(@class,'" + className + "')]");
        Assert.assertEquals(num, webElementList.size());
    }

    @Then("Click on edit button for {string} in my profile")
    public void clickOnEditButtonForInMyProfile(String text) throws Throwable {
        if (text.equals("Email")) {
            WebElement element = SelectByXpath.CreateElementByXpath("(//*[contains(@class,'icon-edit')])[1]");
            hp.ClickOnElement(element);
        } else if (text.equals("Mobile number")) {
            WebElement element = SelectByXpath.CreateElementByXpath("(//*[contains(@class,'icon-edit')])[2]");
            hp.ClickOnElement(element);
        } else if (text.equals("Phone number")) {
            WebElement element = SelectByXpath.CreateElementByXpath("(//*[contains(@class,'icon-edit')])[3]");
            hp.ClickOnElement(element);
        } else if (text.equals("Contact address")) {
            WebElement element = SelectByXpath.CreateElementByXpath("(//*[contains(@class,'icon-edit')])[4]");
            hp.ClickOnElement(element);
        } else if (text.equals("Permanent address")) {
            WebElement element = SelectByXpath.CreateElementByXpath("(//*[contains(@class,'icon-video')])[1]");
            hp.ClickOnElement(element);
        }
    }

    @And("Use mobile app to complete contact change")
    public void useMobileAppToCompleteContactChange() throws Throwable {
        rh.useMobileAppToCompleteContactChange();
    }

    @And("Assert element with text {string} has following sibling tag {string} with attribute {string} from text {string}")
    public void assertElementWithTextHasFollowingSiblingTagWithAttributeFromText(String text, String siblingTag, String attribute, String expected) throws Throwable {
        String xPath = "//*[text()='" + text + "']//following-sibling::" + siblingTag + "";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String actualAddress = element.getAttribute(attribute);
        assertEquals(expected, actualAddress);
    }

    @And("Enter text {string} into element with label contains text {string} with following sibling tag {string} and descendant tag {string}")
    public void enterTextIntoElementWithLabelContainsTextWithFollowingSiblingTagAndDescendantTag(String text, String containedText, String followingSiblingTag, String descendantTag) throws Throwable {
        String xPath = "//label[contains(text(),'" + containedText + "')]/following-sibling::" + followingSiblingTag + "//" + descendantTag + "";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        hp.EnterTextToElement(element, text);
    }

    @And("Click on button Save to change profile data for {string}")
    public void clickOnButtonSaveToChangeProfileDataFor(String text) throws Throwable {
        if (text.equals("Email")) {
            WebElement element = SelectByXpath.CreateElementByXpath("(//*[contains(text(),'Save')])[1]");
            hp.ClickOnElement(element);
        } else if (text.equals("Mobile number")) {
            WebElement element = SelectByXpath.CreateElementByXpath("(//*[contains(text(),'Save')])[2]");
            hp.ClickOnElement(element);
        } else if (text.equals("Phone number")) {
            WebElement element = SelectByXpath.CreateElementByXpath("(//*[contains(text(),'Save')])[3]");
            hp.ClickOnElement(element);
        } else if (text.equals("Contact address")) {
            WebElement element = SelectByXpath.CreateElementByXpath("(//*[contains(text(),'Save')])[4]");
            hp.ClickOnElement(element);
        } else if (text.equals("Permanent address")) {
            WebElement element = SelectByXpath.CreateElementByXpath("(//*[contains(text(),'Save')])[5]");
            hp.ClickOnElement(element);
        }
    }

    @And("Assert button Save for change profile data for {string} is disabled")
    public void assertButtonSaveForChangeProfileDataForIsDisabled(String text) throws Throwable {
        if (text.equals("Email")) {
            WebElement element = SelectByXpath.CreateElementByXpath("(//*[contains(text(),'Save')]/ancestor::button)[1]");
            Assert.assertEquals("true", element.getAttribute("disabled"));
        } else if (text.equals("Mobile number")) {
            WebElement element = SelectByXpath.CreateElementByXpath("(//*[contains(text(),'Save')]/ancestor::button)[2]");
            Assert.assertEquals("true", element.getAttribute("disabled"));
        } else if (text.equals("Phone number")) {
            WebElement element = SelectByXpath.CreateElementByXpath("(//*[contains(text(),'Save')]/ancestor::button)[3]");
            Assert.assertEquals("true", element.getAttribute("disabled"));
        } else if (text.equals("Contact address")) {
            WebElement element = SelectByXpath.CreateElementByXpath("(//*[contains(text(),'Save')]/ancestor::button)[4]");
            Assert.assertEquals("true", element.getAttribute("disabled"));
        } else if (text.equals("Permanent address")) {
            WebElement element = SelectByXpath.CreateElementByXpath("(//*[contains(text(),'Save')]/ancestor::button)[5]");
            Assert.assertEquals("true", element.getAttribute("disabled"));
        }
    }

    @And("Assert element with text {string} has following sibling tag {string} with attribute {string} contains text {string}")
    public void assertElementWithTextHasFollowingSiblingTagWithAttributeContainsText(String text, String siblingTag, String attribute, String expected) throws Throwable {
        String xPath = "//*[text()='" + text + "']//following-sibling::" + siblingTag + "";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String actualAddress = element.getAttribute(attribute);
        assertTrue(actualAddress.contains(expected));
    }

    @And("Assert Standing order default start date is correct")
    public void assertStandingOrderDefaultStartDateIsCorrect() throws Throwable {
        String xPath = "//label[contains(text(), 'Start date')]/following-sibling::div//input";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String expected = Utilities.getDateXDaysFromTodayInFormat(1, "dd.MM.yyyy");
        Assert.assertEquals(expected, element.getAttribute("value"));
    }

    @And("Assert Payment Amount in review is from txt file under key {string} in currency {string}")
    public void assertPaymentAmountInReviewIsFromTxtFileUnderKeyInCurrency(String key, String currency) throws Throwable {
        String expectedAmount = Utilities.getDataFromTxtFileUnderKey(key).replace(".", ",") + " " + currency;
        String xPathForPaymentAmountAssert = "//*[contains(text(),'Payment amount')]//ancestor::nlb-heading-text//following-sibling::*//*[contains(text(),'" + expectedAmount + "')]";
        WebElement elementForPaymentAmount = SelectByXpath.CreateElementByXpath(xPathForPaymentAmountAssert);
        assertTrue(elementForPaymentAmount.isDisplayed());
    }

    @And("Click on date {int} days in the future in second payment screen and remember date under key {string}")
    public void clickOnDateDaysInTheFutureInSecondPaymentScreenAndRememberDateUnderKey(int days, String key) throws Throwable {
        String dateInFuture = ActionApiHelpers.getTodayDatePlusXDaysInFormat(days, "dd.MM.YYYY");
        Utilities.saveTheValueToFile(dateInFuture, key);
        String date = hp.returnDateInSlovenianFormat(dateInFuture);
        //String xPath = "//*[@aria-label='"+date+"']";
        String xPath = "//*[@aria-label='" + date + "' and not(contains(@class, 'hidden'))]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Assert {string} in payment review is from txt file under key {string}")
    public void assertInPaymentReviewIsFromTxtFileUnderKey(String field, String key) throws Throwable {
        String expectedValue = Utilities.getDataFromTxtFileUnderKey(key);
        String xPathForElementAssert = "//*[contains(text(),'" + field + "')]//following-sibling::*";
        WebElement elementForAssert = SelectByXpath.CreateElementByXpath(xPathForElementAssert);
        assertEquals(expectedValue, elementForAssert.getAttribute("textContent").trim());
    }

    @And("Check if authorization is needed and complete standing order with account iban from Excel {string} columnName {string} amount from file under key {string} and currency {string} with message {string}")
    public void checkIfAuthorizationIsNeededAndCompleteStandingOrderWithAccountIbanFromExcelColumnNameAmountFromFileUnderKeyAndCurrencyWithMessage(String rowindex, String columnName, String amountKey, String currency, String notifMessage) throws Throwable {
        String amount = Utilities.getDataFromTxtFileUnderKey(amountKey);
        rh.checkIfAuthIsNeededAndCompleteStandingOrderFor(rowindex, columnName, amount, currency, notifMessage);
    }

    @And("Scroll to Standing order from txt file under key {string}")
    public void scrollToStandingOrderFromTxtFileUnderKey(String key) throws Throwable {
        String text = Utilities.getDataFromTxtFileUnderKey(key).replace(".", ",");
        String xPath = "//*[contains(text(), '" + text + "')]/ancestor::nlb-payment-item";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        JSHelpers.ScrollIntoViewBottom(element);
        hp.ClickOnElement(element);
    }

    @And("Assert that Standing order under key {string} from txt file has date under key {string} from txt file")
    public void assertThatStandingOrderUnderKeyFromTxtFileHasDateUnderKeyFromTxtFile(String key1, String key2) throws Throwable {
        String amount = Utilities.getDataFromTxtFileUnderKey(key1).replace(".", ",");
        String expectedDate = Utilities.getDataFromTxtFileUnderKey(key2);
        String xPath = "//*[contains(text(), '" + amount + "')]/ancestor::nlb-payment-item//*[contains(text(), '" + expectedDate + "')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert that amount for Standing order under key {string} from txt file has currency {string}")
    public void assertThatAmountForStandingOrderUnderKeyFromTxtFileHasCurrency(String key, String currency) throws Throwable {
        String amount = Utilities.getDataFromTxtFileUnderKey(key).replace(".", ",");
        String xPath = "(//*[contains(text(), '" + amount + "')]/ancestor::nlb-payment-item//*/nlb-amount)[1]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        Assert.assertTrue(element.getAttribute("innerText").contains(currency));
    }

    @And("Assert that Purpose field in Standing order header under key {string} from txt file is correct")
    public void assertThatPurposeFieldInStandingOrderHeaderUnderKeyFromTxtFileIsCorrect(String key) throws Throwable {
        String amount = Utilities.getDataFromTxtFileUnderKey(key).replace(".", ",");
        String xPath = "//*[contains(text(), '" + amount + "')]/ancestor::nlb-payment-item//nlb-heading-text//*[contains(text(), 'Standing order')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert that Creditor name in Standing order header under key {string} from txt file is from Excel {string} columnName {string}")
    public void assertThatCreditorNameInStandingOrderHeaderUnderKeyFromTxtFileIsFromExcelColumnName(String key, String rowindex, String columnName) throws Throwable {
        String expected = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String amount = Utilities.getDataFromTxtFileUnderKey(key).replace(".", ",");
        String xPath = "//*[contains(text(), '" + amount + "')]/ancestor::nlb-payment-item//*[text()= '" + expected + "']";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert Icon for Standing order under key {string} from txt file")
    public void assertIconForStandingOrderUnderKeyFromTxtFile(String key) throws Throwable {
        String amount = Utilities.getDataFromTxtFileUnderKey(key).replace(".", ",");
        String xPath = "//*[contains(text(), '" + amount + "')]/ancestor::nlb-payment-item[@iconname='icon-standing-order']";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert element by tag {string} withn descendant tag {string} containing text {string}")
    public void assertElementByTagWithnDescendantTagContainingText(String tag1, String tag2, String text) throws Throwable {
        String xPath = "//" + tag1 + "//" + tag2 + "[contains(text(), '" + text + "')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert that {string} in opened standing order has today date")
    public void assertThatInOpenedStandingOrderHasTodayDate(String field) throws Throwable {
        String date = Utilities.todayDDMMYYYY();
        String xPathForDataCheck = "(//*[text()='" + field + "']//following-sibling::div)[2]";
        WebElement elementForDataCheck = SelectByXpath.CreateElementByXpath(xPathForDataCheck);
        assertEquals(date.trim(), elementForDataCheck.getAttribute("textContent").trim());
    }

    @And("Assert that Payment day for standing order in details is correct by value under key {string} from txt file")
    public void assertThatPaymentDayForStandingOrderInDetailsIsCorrectByValueUnderKeyFromTxtFile(String key) throws Throwable {
        String date = Utilities.getDataFromTxtFileUnderKey(key).substring(0, 2);
        if (date.startsWith("0")) {
            date = date.substring(1);
        }
        String xPathForDataCheck = "(//*[text()='Payment day']//following-sibling::div)[2]";
        WebElement elementForDataCheck = SelectByXpath.CreateElementByXpath(xPathForDataCheck);
        Assert.assertTrue(elementForDataCheck.isDisplayed());
        Assert.assertTrue(elementForDataCheck.getAttribute("textContent").contains(date));
        Assert.assertTrue(elementForDataCheck.getAttribute("textContent").contains("of month"));
    }

    @And("Scroll element by contains text {string} up")
    public void scrollElementByContainsTextUp(String text) throws Throwable {
        WebElement element = SelectByText.CreateElementByXpathContainingText(text);
        JSHelpers.ScrollIntoView(element);
    }

    @And("Assert Icon for Standing order in Upcoming payment by text under key {string} from txt file")
    public void assertIconForStandingOrderInUpcomingPaymentByTextUnderKeyFromTxtFile(String key) throws Throwable {
        String amount = Utilities.getDataFromTxtFileUnderKey(key).replace(".", ",");
        String xPath = "(//*[contains(text(), '" + amount + "')]/ancestor::nlb-payment-item//i[contains(@class, 'icon-upcoming-payments')])[2]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Remember Standing order default start date under key {string}")
    public void rememberStandingOrderDefaultStartDateUnderKey(String key) throws Throwable {
        String xPath = "//label[contains(text(), 'Start date')]/following-sibling::div//input";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        Utilities.saveTheValueToFile(element.getAttribute("value"), key);
    }

    @And("Assert end date is one year in future from date under key {string}")
    public void assertEndDateIsOneYearInFutureFromDateUnderKey(String key) throws Throwable {
        String startDate = Utilities.getDataFromTxtFileUnderKey(key);
        String expectedEndDate = Utilities.getDateXYearsInFutureFromDateDDMMYYYY(startDate, 1);
        String xPath = "//span[contains(text(), 'On date')]/ancestor::nlb-radio-button/ancestor::div[1]/following-sibling::div//input";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        Assert.assertEquals(expectedEndDate, element.getAttribute("value"));
    }

    @And("Remember end date under key {string}")
    public void rememberEndDateUnderKey(String key) throws Throwable {
        String xPath = "//span[contains(text(), 'On date')]/ancestor::nlb-radio-button/ancestor::div[1]/following-sibling::div//input";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        Utilities.saveTheValueToFile(element.getAttribute("value"), key);
    }

    @And("Assert standing order schedule info is correct using dates from {string} and {string}")
    public void assertStandingOrderScheduleInfoIsCorrectUsingDatesFromAnd(String key1, String key2) throws Throwable {
        String startDate = Utilities.getDataFromTxtFileUnderKey(key1);
        String endDate = Utilities.getDataFromTxtFileUnderKey(key2);
        String xPath = "//nlb-standing-order-schedule-info";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String actualText = element.getAttribute("innerText");
        String expectedText = "Your standing order will be processed monthly, starting with " + startDate + " and until " + endDate + " in line with Payments execution schedule (external link).";
        assertEquals(expectedText.trim(), actualText.trim());
    }

    @And("Assert that Creditor name in Standing order header under key {string} from txt file contains text from Excel {string} columnName {string}")
    public void assertThatCreditorNameInStandingOrderHeaderUnderKeyFromTxtFileContainsTextFromExcelColumnName(String key, String rowindex, String columnName) throws Throwable {
        String expected = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String amount = Utilities.getDataFromTxtFileUnderKey(key).replace(".", ",");
        String xPath = "//*[contains(text(), '" + amount + "')]/ancestor::nlb-payment-item//*[contains(text(), '" + expected + "')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Wait for icon of Standing order under key {string}")
    public void waitForIconOfStandingOrderUnderKey(String key) throws InterruptedException {
        WaitHelpers.waitForSeconds(4);
        String amount = Utilities.getDataFromTxtFileUnderKey(key).replace(".", ",");
        String xPath = "(//*[contains(text(), '" + amount + "')]/ancestor::nlb-payment-item//i[contains(@class, 'icon-upcoming-payments')])[2]";
        By element = SelectByXpath.CreateByElementByXpath(xPath);
        WaitHelpers.WaitForElement(element);

    }

    @And("Assert that transaction address {string} in opened past payment is from Excel {string} columnName {string}")
    public void assertThatTransactionAddressInOpenedPastPaymentIsFromExcelColumnName(String text, String rowindex, String columnName) throws Throwable {
        String stringForExpectedValue = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPathForDataCheck = "(//*[text()='" + text + "']//following-sibling::div)[2]";
        WebElement elementForDataCheck = SelectByXpath.CreateElementByXpath(xPathForDataCheck);
        Assert.assertTrue(elementForDataCheck.getAttribute("textContent").replaceAll("\\s", "").contains(stringForExpectedValue.replaceAll("\\s", "")));
    }

    @And("Assert field {string} for Standing order cancellation has value from Excel {string} columnName {string}")
    public void assertFieldForStandingOrderCancellationHasValueFromExcelColumnName(String fieldName, String rowindex, String columnName) throws Throwable {
        String expected = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPath = "//*[contains(text(), '" + fieldName + "')]/following-sibling::div";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        Assert.assertTrue(element.getAttribute("textContent").contains(expected));
    }

    @And("Assert Amount for Standing order cancellation has value under key {string} from txt file")
    public void assertAmountForStandingOrderCancellationHasValueUnderKeyFromTxtFile(String key) throws Throwable {
        String expected = Utilities.getDataFromTxtFileUnderKey(key).replace(".", ",");
        String xPath = "//*[contains(text(), 'Payment amount')]/following-sibling::div";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        Assert.assertTrue(element.getAttribute("textContent").contains(expected));
        Assert.assertTrue(element.getAttribute("textContent").contains("EUR"));
    }

    @And("Assert element by tag {string} contains text {string} and ancestor tag {string}")
    public void assertElementByTagContainsTextAndAncestorTag(String tag, String text, String ancestor) throws Throwable {
        String xPath = "//" + tag + "[contains(text(),'" + text + "')]/ancestor::" + ancestor;
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert element by tag {string} contains text {string} and ancestor tag {string} is enabled")
    public void assertElementByTagContainsTextAndAncestorTagIsEnabled(String tag, String text, String ancestor) throws Throwable {
        String xPath = "//" + tag + "[contains(text(),'" + text + "')]/ancestor::" + ancestor;
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        Assert.assertTrue(element.isEnabled());
    }

    @And("Assert there is no element by contains text under key {string} from txt file")
    public void assertThereIsNoElementByContainsTextUnderKeyFromTxtFile(String key) throws Throwable {
        String text = Utilities.getDataFromTxtFileUnderKey(key);
        String xPath = "//*[contains(text(), '" + text + "')]";
        By el = By.xpath(xPath);
        boolean messageExists = ActionApiHelpers.isElementDisplayedCustomWithWaitToDisappear(el, 10, 2000);
        assertFalse(messageExists);
    }

    @And("Wait for element by contains text {string} with index {string}")
    public void waitForElementByContainsTextWithIndex(String text, String index) throws InterruptedException {
        By elForWaitElement = SelectByXpath.CreateByElementByXpath("(//*[contains(text(), '" + text + "')])[" + index + "]");
        WaitHelpers.WaitForElement(elForWaitElement);
    }

    @And("Assert there is no category {string} in the list present")
    public void assertThereIsNoCategoryInTheListPresent(String text) throws Throwable {
        String xPath = "//*[contains(@class,'splitCategoriesList')]//span[contains(text(), '" + text + "')]";
        By el = By.xpath(xPath);
        boolean messageExists = ActionApiHelpers.isElementDisplayedCustomWithWaitToDisappear(el, 10, 2000);
        assertFalse(messageExists);
    }

    @And("Open contact info in payment screen for account from Excel {string} columnName {string}")
    public void openContactInfoInPaymentScreenForAccountFromExcelColumnName(String rowindex, String columnName) throws Throwable {
        String accountIban = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPath = "//*[contains(text(),'" + accountIban + "')]/ancestor::div[1]/following-sibling::div//i";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Click Repeat payment for payment with purpose under key {string} from txt file")
    public void clickRepeatPaymentForPaymentWithPurposeUnderKeyFromTxtFile(String key) throws Throwable {
        String purpose = Utilities.getDataFromTxtFileUnderKey(key);
        String xPath = "//*[text()='" + purpose + "']/ancestor::div[1]/ancestor::div[1]/following-sibling::div//span[text()='Repeat']";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Assert payment purpose is from key {string} in txt file in second payment screen")
    public void assertPaymentPurposeIsFromKeyInTxtFileInSecondPaymentScreen(String key) throws Throwable {
        String purpose = Utilities.getDataFromTxtFileUnderKey(key);
        String xPathForPurposeField = "(//nlb-input-text//input)[1]";
        WebElement elementForPurposeField = SelectByXpath.CreateElementByXpath(xPathForPurposeField);
        assertEquals(purpose, elementForPurposeField.getAttribute("value"));
    }

    @And("Assert that first payment in last five payments has purpose from key {string} from txt file")
    public void assertThatFirstPaymentInLastFivePaymentsHasPurposeFromKeyFromTxtFile(String key) throws Throwable {
        String purpose = Utilities.getDataFromTxtFileUnderKey(key);
        String xPath = "(//*[@class='subheadline medium tw-text-gray-100'])[1]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        Assert.assertEquals(purpose, element.getAttribute("textContent"));
    }

    @Then("Assert tabs in Product details are displayed correctly for Credit Cards")
    public void assertTabsInProductDetailsAreDisplayedCorrectlyForCreditCards() throws Throwable {
        String xPath = "//nlb-tabs//a";
        List<WebElement> tabsElements = SelectByXpath.CreateElementsByXpath(xPath);
        int numOfTabs = tabsElements.size();
        for (int i = 0; i < numOfTabs; i++) {
            if (i == 0) {
                assertEquals("Transactions", tabsElements.get(i).getAttribute("innerText"));
            } else if (i == 1) {
                assertEquals("Settings", tabsElements.get(i).getAttribute("innerText"));
            } else if (i == 2) {
                assertEquals("Statements", tabsElements.get(i).getAttribute("innerText"));
            } else if (i == 3) {
                assertEquals("Details", tabsElements.get(i).getAttribute("innerText"));
            } else {
                fail("More than 4 tabs are found");
            }
        }

        String defaultSelectedxPath = "//nlb-tabs//a[contains(@class, ' tw-text-primaryColor')]";
        WebElement defaultSelectedElement = SelectByXpath.CreateElementByXpath(defaultSelectedxPath);
        assertEquals("Transactions", defaultSelectedElement.getAttribute("innerText"));
    }

    @And("Assert transactions are grouped by months for credit card transactions")
    public void assertTransactionsAreGroupedByMonthsForCreditCardTransactions() throws Throwable {

        String xPath = "(//nlb-transactions-list-view//h3)[1]";
        WebElement elementForMonth = SelectByXpath.CreateElementByXpath(xPath);
        String month = elementForMonth.getAttribute("textContent");

        Assert.assertTrue(
                month.contains("January")
                        || month.contains("February")
                        || month.contains("March")
                        || month.contains("April")
                        || month.contains("May")
                        || month.contains("June")
                        || month.contains("July")
                        || month.contains("August")
                        || month.contains("September")
                        || month.contains("October")
                        || month.contains("November")
                        || month.contains("December"));
    }

    @And("Assert document with name starting with {string} and has file type {string} contains purpose from txt key {string}")
    public void assertDocumentWithNameStartingWithAndHasFileTypeContainsPurposeFromTxtKey(String name, String fileType, String key) {
        String path = DataManager.getDataFromHashDatamap("1", "pdf_download_path");
        String purpose = Utilities.getDataFromTxtFileUnderKey(key);

        String pdfContent = Utilities.getContentFromPDFFile(path, name);

        Assert.assertTrue(pdfContent.contains("Znesek / Amount:"));
        Assert.assertTrue(pdfContent.contains("Namen / Purpose"));
        Assert.assertTrue(pdfContent.contains(purpose));
        Assert.assertTrue(pdfContent.contains("Referenca / Reference:"));
        Assert.assertTrue(pdfContent.contains("Datum valute / Value date:"));
        Assert.assertTrue(pdfContent.contains("Ime plačnika / Debtor name:"));
        Assert.assertTrue(pdfContent.contains("Naslov plačnika / Debtor address"));
        Assert.assertTrue(pdfContent.contains("IBAN plačnika / Debtor IBAN:"));
        Assert.assertTrue(pdfContent.contains("Ime prejemnika / Beneficiary name:"));
        Assert.assertTrue(pdfContent.contains("Naslov prejemnika / Creditor address:"));
        Assert.assertTrue(pdfContent.contains("IBAN prejemnika / Beneficiary IBAN:"));
        Assert.assertTrue(pdfContent.contains("BIC banke prejemnika / BIC code:"));

        System.out.println(pdfContent);
    }

    @Then("Assert payment is shown correctly in past payments")
    public void assertPaymentIsShownCorrectlyInPastPayments() throws Throwable {
        //icon
        String iconxPath = "(//nlb-payment-item//i[contains(@class, 'nlb-icon')])[1]";
        WebElement iconElement = SelectByXpath.CreateElementByXpath(iconxPath);
        //assertTrue(iconElement.is());
        //date
        String datexPath = "(//nlb-payment-item//div[contains(@class, 'subheadline')][1])[1]";
        WebElement dateElement = SelectByXpath.CreateElementByXpath(datexPath);
        assertTrue(dateElement.isDisplayed());
        assertTrue(dateElement.getAttribute("innerText").matches("^(0[1-9]|[1-2][0-9]|3[01])\\.(0[1-9]|1[0-2])\\.\\d{4}$"));
        //debtor
        String debtorxPath = "(//nlb-payment-item//div[contains(@class, 'caption')][2])[1]";
        WebElement debtorElement = SelectByXpath.CreateElementByXpath(debtorxPath);
        assertTrue(debtorElement.isDisplayed());
        assertFalse(debtorElement.getAttribute("innerText") == null && debtorElement.getAttribute("innerText").trim().isEmpty());
        //purpose
        String purposexPath = "(//nlb-payment-item//nlb-heading-text/*[contains(@class, 'medium')])[1]";
        WebElement purposeElement = SelectByXpath.CreateElementByXpath(purposexPath);
        assertTrue(debtorElement.isDisplayed());
        assertFalse(purposeElement.getAttribute("innerText") == null && debtorElement.getAttribute("innerText").trim().isEmpty());
        //amount
        String amountxPath = "(//nlb-payment-item//nlb-amount/div/div[2])[1]";
        //String amountxPath = "(//nlb-transaction-card//nlb-amount/div/span[1])[1]";
        WebElement amountElement = SelectByXpath.CreateElementByXpath(amountxPath);
        assertTrue(amountElement.isDisplayed());
        assertTrue(amountElement.getAttribute("innerText").matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{2}"));
        //currency
        String currencyxPath = "(//nlb-payment-item//nlb-amount//span[2])[1]";
        WebElement currencyElement = SelectByXpath.CreateElementByXpath(currencyxPath);
        assertTrue(currencyElement.isDisplayed());
        assertEquals("EUR", currencyElement.getAttribute("innerText"));
        //transaction details toggle button
        String trxDetailsxPath = "(//nlb-payment-item//nlb-icon/i[contains(@class, 'icon-chevron-down')])[1]";
        WebElement trxDetailsElement = SelectByXpath.CreateElementByXpath(trxDetailsxPath);
        assertTrue(trxDetailsElement.isDisplayed());
    }

    @And("Assert Calendar filter is shown")
    public void assertCalendarFilterIsShown() throws Throwable {
        String xPath = "//*[contains(@class,'icon-calendar-today')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert Basic filter is shown")
    public void assertBasicFilterIsShown() throws Throwable {
        String xPath = "//*[contains(@class,'icon-filter')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Click on basic filter")
    public void clickOnBasicFilter() throws Throwable {
        String xPath = "//*[contains(@class,'icon-filter')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Click on down arrow on first payment to display details")
    public void clickOnDownArrowOnFirstPaymentToDisplayDetails() throws Throwable {
        String xPath = "(//nlb-payment-item//nlb-icon/i[contains(@class, 'icon-chevron-down')])[1]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Assert that transaction {string} in opened past payment is filled")
    public void assertThatTransactionInOpenedPastPaymentIsFilled(String text) throws Throwable {
        String xPathForDataCheck = "(//*[text()='" + text + "']//following-sibling::div)[2]";
        WebElement elementForDataCheck = SelectByXpath.CreateElementByXpath(xPathForDataCheck);
        assertTrue(elementForDataCheck.getAttribute("textContent").length() >= 3);
    }

    @And("Assert current date is shown in currency exchange rates page")
    public void assertCurrentDateIsShownInCurrencyExchangeRatesPage() throws Throwable {
        String xPath = "//*[@class='tw-font-medium']";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String expectedDate = Utilities.getDateXDaysFromTodayInFormat(0, "dd.MM.yyyy");
        Assert.assertEquals(expectedDate, element.getAttribute("textContent"));
    }

    @And("Assert country flags in currency exchange are correct")
    public void assertCountryFlagsInCurrencyExchangeAreCorrect() throws Throwable {
        List<WebElement> listOfWebElement = SelectByXpath.CreateElementsByXpath("//figcaption//img");
        int numOfFlags = listOfWebElement.size();
        for (int i = 0; i < numOfFlags; i++) {
            if (i == 0) {
                assertTrue(listOfWebElement.get(i).getAttribute("src").contains("assets/img/flags/AUD.svg"));
            } else if (i == 1) {
                assertTrue(listOfWebElement.get(i).getAttribute("src").contains("assets/img/flags/CAD.svg"));
            } else if (i == 2) {
                assertTrue(listOfWebElement.get(i).getAttribute("src").contains("assets/img/flags/CHF.svg"));
            } else if (i == 3) {
                assertTrue(listOfWebElement.get(i).getAttribute("src").contains("assets/img/flags/DKK.svg"));
            } else if (i == 4) {
                assertTrue(listOfWebElement.get(i).getAttribute("src").contains("assets/img/flags/GBP.svg"));
            } else if (i == 5) {
                assertTrue(listOfWebElement.get(i).getAttribute("src").contains("assets/img/flags/HUF.svg"));
            } else if (i == 6) {
                assertTrue(listOfWebElement.get(i).getAttribute("src").contains("assets/img/flags/JPY.svg"));
            } else if (i == 7) {
                assertTrue(listOfWebElement.get(i).getAttribute("src").contains("assets/img/flags/NOK.svg"));
            } else if (i == 8) {
                assertTrue(listOfWebElement.get(i).getAttribute("src").contains("assets/img/flags/SEK.svg"));
            } else if (i == 9) {
                assertTrue(listOfWebElement.get(i).getAttribute("src").contains("assets/img/flags/USD.svg"));
            }
        }
    }

    @And("Assert all bid and ask rates are present")
    public void assertAllBidAndAskRatesArePresent() throws Throwable {
        String xPathForBid = "//*[contains(@class,'semibold tw-hidden xs:tw-flex xs:tw-justify-end')]";
        List<WebElement> webElementList = SelectByXpath.CreateElementsByXpath(xPathForBid);
        Assert.assertEquals(10, webElementList.size());

        String xPathForAsk = "//*[contains(@class,'semibold tw-hidden tw-text-gray-100 xs:tw-flex xs:tw-justify-end')]";
        List<WebElement> webElementList2 = SelectByXpath.CreateElementsByXpath(xPathForAsk);
        Assert.assertEquals(10, webElementList2.size());
    }

    @When("Click on options for user on header")
    public void clickOnOptionsForUserOnHeader() throws Throwable {
        String xPath = "//nlb-dropdown//div[@aria-label='User profile']";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Disable login to web bank from web bank")
    public void disableLoginToWebBankFromWebBank() throws Throwable {
        WebElement elementForWait = SelectByText.CreateElementByXpathText("Online bank");
        WaitHelpers.WaitForElement(elementForWait, "Element");

        //String xPathbuttonForToggle = "//nlb-settings-item[@title='Online bank']//nlb-toggle-button-ios";
        String xPathbuttonForToggle = "(//nlb-settings-item//nlb-toggle-button-ios)[2]";
        WebElement elementForToggle = SelectByXpath.CreateElementByXpath(xPathbuttonForToggle);
        hp.ClickOnElement(elementForToggle);

        String xPathForBlockButton = "//button//div[contains(text(),'Block')]";
        WebElement elementForBlockButton = SelectByXpath.CreateElementByXpath(xPathForBlockButton);
        hp.ClickOnElement(elementForBlockButton);
    }

    @And("Try to login to the page using user from Excel {string} columnName {string}")
    public void tryToLoginToThePageUsingUserFromExcelColumnName(String rowindex, String columnName) throws Throwable {
        String username = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String isMocked = DataManager.getDataFromHashDatamap(rowindex, "isMock");
        String pin = DataManager.getDataFromHashDatamap(rowindex, "pin");
        String env = DataManager.getDataFromHashDatamap(rowindex, "currentEnv");
        rh.tryToLoginToThePageUsingUserFromExcelColumnName(username, pin);
    }

    @Given("Enable login to web bank from mobile bank")
    public void enableLoginToWebBankFromMobileBank() throws Throwable {
        ma.enableLoginToWebBank();
    }

    @Then("Disable login to mobile bank from web bank")
    public void disableLoginToMobileBankFromWebBank() throws Throwable {
        WebElement elementForWait = SelectByText.CreateElementByXpathText("Online bank");
        WaitHelpers.WaitForElement(elementForWait, "Element");

        //String xPathbuttonForToggle = "//nlb-settings-item[@title='Mobile bank']//nlb-toggle-button-ios";
        String xPathbuttonForToggle = "(//nlb-settings-item//nlb-toggle-button-ios)[1]";
        WebElement elementForToggle = SelectByXpath.CreateElementByXpath(xPathbuttonForToggle);
        hp.ClickOnElement(elementForToggle);
    }

    @And("Check if user is blocked from mobile bank")
    public void checkIfUserIsBlockedFromMobileBank() throws Throwable {
        ma.checkIfUserIsBlocked();
    }

    @Then("Enable login to mobile bank from web bank")
    public void enableLoginToMobileBankFromWebBank() throws Throwable {
        WebElement elementForWait = SelectByText.CreateElementByXpathText("Online bank");
        WaitHelpers.WaitForElement(elementForWait, "Element");

        String xPathbuttonForToggle = "(//nlb-settings-item//nlb-toggle-button-ios)[1]";
        WebElement elementForToggle = SelectByXpath.CreateElementByXpath(xPathbuttonForToggle);
        hp.ClickOnElement(elementForToggle);
    }

    @And("Check if user is unblocked from mobile bank")
    public void checkIfUserIsUnblockedFromMobileBank() throws Throwable {
        ma.checkIfUserIsUnblocked();
    }

    @Then("Disable payments on mobile bank from web bank")
    public void disablePaymentsOnMobileBankFromWebBank() throws Throwable {
        WebElement elementForWait = SelectByText.CreateElementByXpathText("Online bank");
        WaitHelpers.WaitForElement(elementForWait, "Element");

        String xPathbuttonForToggle = "(//nlb-settings-item//nlb-toggle-button-ios)[1]";
        WebElement elementForToggle = SelectByXpath.CreateElementByXpath(xPathbuttonForToggle);
        hp.ClickOnElement(elementForToggle);
    }

    @And("Check if user is blocked from payments on mobile bank")
    public void checkIfUserIsBlockedFromPaymentsOnMobileBank() throws Throwable {
        ma.checkIfUserIsBlockedFromPaymentsOnMobileBank();
    }

    @Then("Enable payments on mobile bank from web bank")
    public void enablePaymentsOnMobileBankFromWebBank() throws Throwable {
        WebElement elementForWait = SelectByText.CreateElementByXpathText("Online bank");
        WaitHelpers.WaitForElement(elementForWait, "Element");

        String xPathbuttonForToggle = "(//nlb-settings-item//nlb-toggle-button-ios)[1]";
        WebElement elementForToggle = SelectByXpath.CreateElementByXpath(xPathbuttonForToggle);
        hp.ClickOnElement(elementForToggle);
    }

    @And("Check if user is unblocked from payments on mobile bank")
    public void checkIfUserIsUnblockedFromPaymentsOnMobileBank() throws Throwable {
        ma.checkIfUserIsUnBlockedFromPaymentsOnMobileBank();
    }

    @Given("Disable login to mobile bank from mobile bank")
    public void disableLoginToMobileBankFromMobileBank() throws Throwable {
        ma.disableLoginToMobileBank();
    }

    @Given("Disable login to web bank from mobile bank")
    public void disableLoginToWebBankFromMobileBank() throws Throwable {
        ma.disableLoginToWebBank();
    }

    @Given("Disable payments on web bank from mobile bank")
    public void disablePaymentsOnWebBankFromMobileBank() throws Throwable {
        ma.disablePaymentsOnWebBank();
    }

    @Given("Enable payments on web bank from mobile bank")
    public void enablePaymentsOnWebBankFromMobileBank() throws Throwable {
        ma.enablePaymentsOnWebBank();
    }

    @When("Assert sidebar {string} is displayed")
    public void assertSidebarIsDisplayed(String text) throws Throwable {
        String xPath = "//*[contains(@class,'tw-min-w-sidebarNavigation') and not(contains(@class, 'md:tw-hidden'))]//nlb-icon//following-sibling::*[contains(text(),'" + text + "')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert notification bell at the right top corner of the screen")
    public void assertNotificationBellAtTheRightTopCornerOfTheScreen() throws Throwable {
        String xPath = "//button//nlb-icon//i[contains(@class,'icon-bell')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert user profile icon has value from excel {string} columnName {string}")
    public void assertUserProfileIconHasValueFromExcelColumnName(String rowindex, String columnName) throws Throwable {
        String expectedText = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPath = "//nlb-dropdown//div[@aria-label='User profile']";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String actualText = element.getAttribute("textContent");
        Assert.assertEquals(expectedText, actualText.replace(" ",""));
    }

    @And("Remember current balance in {string} for selected account under key {string}")
    public void rememberCurrentBalanceInForSelectedAccountUnderKey(String currency, String key) throws Throwable {
        String xPath = "//span[contains(text(),'" + currency + "')]/preceding-sibling::span";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String actualBalance = element.getAttribute("textContent");
        actualBalance = actualBalance.replace(".", "").replace(",", ".");
        DataManager.userObject.put(key, actualBalance);
    }

    @And("Compare if current amount balance from key {string} for currency {string} for selected account is reduced by {string}")
    public void compareIfCurrentAmountBalanceFromKeyForCurrencyForSelectedAccountIsReducedBy(String key, String currency, String amount) throws Throwable {
        String xPathForCurrentBalance = "//span[contains(text(),'" + currency + "')]/preceding-sibling::span";
        WebElement elementForCurrentBalance = SelectByXpath.CreateElementByXpath(xPathForCurrentBalance);
        String actualAmount = elementForCurrentBalance.getAttribute("textContent").replace(".", "").replace(",", ".");
        String expectedAmountFromKey = (String) DataManager.userObject.get(key);
        Double expectedAmountDouble = Double.parseDouble(expectedAmountFromKey);
        Double reduceBy = Double.parseDouble(amount);
        Double expectedAmount = expectedAmountDouble - reduceBy;
        //assertEquals(expectedAmount.toString(),actualAmount);
        Double doubleActual = Double.parseDouble(actualAmount);
        System.out.printf("%.2f%n", doubleActual);
        System.out.printf("%.2f%n", expectedAmount);
        assertEquals(expectedAmount, doubleActual);
    }

    @Then("Assert that transaction date for first nlb funds is correct")
    public void assertThatTransactionDateForFirstNlbFundsIsCorrect() throws Throwable {
        String xPath = "(//*[contains(@class,'caption medium tw-flex tw-items-center tw-text-gray-400')])[1]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String actualDate = element.getAttribute("textContent");
        Assert.assertEquals(" 04.02.2025 ", actualDate);
    }

    @And("Assert that purpose for first nlb funds is correct")
    public void assertThatPurposeForFirstNlbFundsIsCorrect() throws Throwable {
        String xPath = "(//*[contains(@class,'medium tw-text-gray-100')]//div)[1]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String actualDate = element.getAttribute("textContent");
        Assert.assertEquals(" Vplačilo v podsklad ", actualDate);
    }

    @And("Assert that creditor for first nlb funds is correct")
    public void assertThatCreditorForFirstNlbFundsIsCorrect() throws Throwable {
        String xPath = "(//*[contains(@class,'caption medium tw-text-gray-400 xs:subheadline')])[1]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String actualDate = element.getAttribute("textContent");
        Assert.assertEquals(" NLB Skladi - Azija delniški ", actualDate);
    }

    @And("Assert export button is displayed correctly in Transaction list")
    public void assertExportButtonIsDisplayedCorrectlyInTransactionList() throws Throwable {
        String xPath = "//nlb-circle-button//i[@aria-label='icon-download']";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert product from Excel {string} with name {string} and iban {string} is displayed as active on dashboard")
    public void assertProductFromExcelWithNameAndIbanIsDisplayedAsActiveOnDashboard(String rowindex, String columnName1, String columnName2) throws Throwable {
        String accountName = DataManager.getDataFromHashDatamap(rowindex, columnName1);
        String accountIban = DataManager.getDataFromHashDatamap(rowindex, columnName2);
        String xPathForAccountName = "//swiper-slide[contains(@class,'swiper-slide-active')]/nlb-dashboard-product-card//*[contains(text(),'" + accountName + "')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPathForAccountName);
        Assert.assertTrue(element.isDisplayed());
        String xPathForAccountIban = "//swiper-slide[contains(@class,'swiper-slide-active')]/nlb-dashboard-product-card//*[contains(text(),'" + accountIban + "')]";
        WebElement element2 = SelectByXpath.CreateElementByXpath(xPathForAccountIban);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert currently active product on dashboard has current and available balance from keys {string} and {string}")
    public void assertCurrentlyActiveProductOnDashboardHasCurrentAndAvailableBalanceFromKeysAnd(String key1, String key2) throws Throwable {
        String currentBalance = (String) DataManager.userObject.get(key1);
        String availableBalance = (String) DataManager.userObject.get(key2);
        String xPathForCurrentBalance = "//swiper-slide[contains(@class,'swiper-slide-active')]/nlb-dashboard-product-card//*[contains(text(),'Current balance')]/following-sibling::*//*[contains(text(),'" + currentBalance + "')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPathForCurrentBalance);
        Assert.assertTrue(element.isDisplayed());

        String xPathForAvailableBalance = "//swiper-slide[contains(@class,'swiper-slide-active')]/nlb-dashboard-product-card//*[contains(text(),'Current balance')]/following-sibling::*//*[contains(text(),'" + availableBalance + "')]";
        WebElement element2 = SelectByXpath.CreateElementByXpath(xPathForCurrentBalance);
        Assert.assertTrue(element2.isDisplayed());
    }

    @And("Click on element by aria label {string}")
    public void clickOnElementByAriaLabel(String text) throws Throwable {
        String xPath = "//*[@aria-label='" + text + "']";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Assert element by tag {string} contains text from Excel {string} columnName {string}")
    public void assertElementByTagContainsTextFromExcelColumnName(String tag, String rowindex, String columnName) throws Throwable {
        String accountIban = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPath = "//nlb-iban[contains(text(),'" + accountIban + "')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Remember first {string} transaction purposes under key {string}")
    public void rememberFirstTransactionPurposesUnderKey(String count, String key) throws Throwable {
        int max = Integer.parseInt(count);
        String purposeXpath = "//nlb-transaction-card//div/div[2]//nlb-heading-text/*[contains(@class,'tw-text-gray-100')]";
        List<WebElement> purposeElements = SelectByXpath.CreateElementsByXpath(purposeXpath);
        List<String> purposes = new ArrayList<>();
        for (int i = 0; i < max; i++) {
            purposes.add(purposeElements.get(i).getAttribute("innerText"));
        }
        DataManager.userObject.put(key, purposes);
    }

    @And("Assert transactions shown in dashboard are the same as in key {string}")
    public void assertTransactionsShownInDashboardAreTheSameAsInKey(String key) throws Throwable {
        String purposeXpath = "//nlb-transaction-card//div/div[2]//nlb-heading-text/*[contains(@class,'tw-text-gray-100')]";
        List<WebElement> purposeElements = SelectByXpath.CreateElementsByXpath(purposeXpath);
        List<String> purposes = new ArrayList<>();
        for (int i = 0; i < 3; i++) {
            purposes.add(purposeElements.get(i).getAttribute("innerText"));
        }
        List<String> expectedPurpose = (List<String>) DataManager.userObject.get(key);
        Assert.assertEquals(expectedPurpose, purposes);
    }

    @And("Remember first {string} payment purposes under key {string}")
    public void rememberFirstPaymentPurposesUnderKey(String count, String key) throws Throwable {
        int max = Integer.parseInt(count);
        String purposeXpath = "//nlb-payment-item//div/div[2]//nlb-heading-text/*[contains(@class,'tw-text-gray-100')]";
        List<WebElement> purposeElements = SelectByXpath.CreateElementsByXpath(purposeXpath);
        List<String> purposes = new ArrayList<>();
        for (int i = 0; i < max; i++) {
            purposes.add(purposeElements.get(i).getAttribute("innerText"));
        }
        DataManager.userObject.put(key, purposes);
    }

    @And("Assert payment is shown correctly in dashboard for upcoming payments")
    public void assertPaymentIsShownCorrectlyInDashboardForUpcomingPayments() throws Throwable {
        //icon
        String iconxPath = "(//nlb-payment-item//i[contains(@class, 'nlb-icon')])[1]";
        WebElement iconElement = SelectByXpath.CreateElementByXpath(iconxPath);
        //assertTrue(iconElement.is());
        //date
        String datexPath = "(//nlb-payment-item//div[contains(@class, 'subheadline')][1])[1]";
        WebElement dateElement = SelectByXpath.CreateElementByXpath(datexPath);
        assertTrue(dateElement.isDisplayed());
        assertTrue(dateElement.getAttribute("innerText").matches("^(0[1-9]|[1-2][0-9]|3[01])\\.(0[1-9]|1[0-2])\\.\\d{4}$"));
        //debtor
        String debtorxPath = "(//nlb-payment-item//div[contains(@class, 'caption')][2])[1]";
        WebElement debtorElement = SelectByXpath.CreateElementByXpath(debtorxPath);
        assertTrue(debtorElement.isDisplayed());
        assertFalse(debtorElement.getAttribute("innerText") == null && debtorElement.getAttribute("innerText").trim().isEmpty());
        //purpose
        String purposexPath = "(//nlb-payment-item//nlb-heading-text/*[contains(@class, 'medium')])[1]";
        WebElement purposeElement = SelectByXpath.CreateElementByXpath(purposexPath);
        assertTrue(debtorElement.isDisplayed());
        assertFalse(purposeElement.getAttribute("innerText") == null && debtorElement.getAttribute("innerText").trim().isEmpty());
        //amount
        String amountxPath = "(//nlb-payment-item//nlb-amount/div/div[2])[1]";
        //String amountxPath = "(//nlb-transaction-card//nlb-amount/div/span[1])[1]";
        WebElement amountElement = SelectByXpath.CreateElementByXpath(amountxPath);
        assertTrue(amountElement.isDisplayed());
        assertTrue(amountElement.getAttribute("innerText").matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{2}"));
        //currency
        String currencyxPath = "(//nlb-payment-item//nlb-amount//span[2])[1]";
        WebElement currencyElement = SelectByXpath.CreateElementByXpath(currencyxPath);
        assertTrue(currencyElement.isDisplayed());
        assertEquals("EUR", currencyElement.getAttribute("innerText"));
    }

    @And("Assert transaction is shown correctly in dashboard for latest payments")
    public void assertTransactionIsShownCorrectlyInDashboardForLatestPayments() throws Throwable {
        //icon
        String iconxPath = "(//nlb-transaction-card//i[contains(@class, 'nlb-icon')])[1]";
        WebElement iconElement = SelectByXpath.CreateElementByXpath(iconxPath);
        assertTrue(iconElement.isDisplayed());
        //date
        String datexPath = "(//nlb-transaction-card//div[contains(@class, 'subheadline')][1])[1]";
        WebElement dateElement = SelectByXpath.CreateElementByXpath(datexPath);
        assertTrue(dateElement.isDisplayed());
        assertTrue(dateElement.getAttribute("innerText").matches("^(0[1-9]|[1-2][0-9]|3[01])\\.(0[1-9]|1[0-2])\\.\\d{4}$"));
        //debtor
        String debtorxPath = "(//nlb-transaction-card//div[contains(@class, 'subheadline')][2])[1]";
        WebElement debtorElement = SelectByXpath.CreateElementByXpath(debtorxPath);
        assertTrue(debtorElement.isDisplayed());
        assertFalse(debtorElement.getAttribute("innerText") == null && debtorElement.getAttribute("innerText").trim().isEmpty());
        //purpose
        String purposexPath = "(//nlb-transaction-card//nlb-heading-text/div[contains(@class, 'medium')])[1]";
        WebElement purposeElement = SelectByXpath.CreateElementByXpath(purposexPath);
        assertTrue(debtorElement.isDisplayed());
        assertFalse(purposeElement.getAttribute("innerText") == null && debtorElement.getAttribute("innerText").trim().isEmpty());
        //amount
        String amountxPath = "(//nlb-transaction-card//nlb-amount/div/div[2])[1]";
        //String amountxPath = "(//nlb-transaction-card//nlb-amount/div/span[1])[1]";
        WebElement amountElement = SelectByXpath.CreateElementByXpath(amountxPath);
        assertTrue(amountElement.isDisplayed());
        assertTrue(amountElement.getAttribute("innerText").matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{2}"));
        //currency
        String currencyxPath = "(//nlb-transaction-card//nlb-amount//span[2])[1]";
        WebElement currencyElement = SelectByXpath.CreateElementByXpath(currencyxPath);
        assertTrue(currencyElement.isDisplayed());
        assertEquals("EUR", currencyElement.getAttribute("innerText"));
    }

    @And("Assert payments shown in dashboard are the same as in key {string}")
    public void assertPaymentsShownInDashboardAreTheSameAsInKey(String key) throws Throwable {
        String purposeXpath = "//nlb-payment-item//div/div[2]//nlb-heading-text/*[contains(@class,'tw-text-gray-100')]";
        List<WebElement> purposeElements = SelectByXpath.CreateElementsByXpath(purposeXpath);
        List<String> purposes = new ArrayList<>();
        for (int i = 0; i < 3; i++) {
            purposes.add(purposeElements.get(i).getAttribute("innerText"));
        }
        List<String> expectedPurpose = (List<String>) DataManager.userObject.get(key);
        Assert.assertEquals(expectedPurpose, purposes);
    }

    @And("Assert element from excel {string} columnName {string} in nlb modal")
    public void assertElementFromExcelColumnNameInNlbModal(String rowindex, String columnName) throws Throwable {
        String expectedText = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPath = "//nlb-modal//*[contains(text(),'" + expectedText + "')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert tab {string} is active")
    public void assertTabIsActive(String text) throws Throwable {
        String xPath = "//a[contains(text(),'" + text + "') and contains(@class,'bold')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert account from Excel {string} columnName {string} is displayed in Insights section of dashboard")
    public void assertAccountFromExcelColumnNameIsDisplayedInInsightsSectionOfDashboard(String rowindex, String columnName) throws Throwable {
        String accountIban = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPathForIban = "//nlb-dashboard-insights//*[contains(text(),'" + accountIban + "')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPathForIban);
        Assert.assertTrue(element.isDisplayed());
    }


    @And("Remember latest transaction purposes from dashboard under key {string}")
    public void rememberLatestTransactionPurposesFromDashboardUnderKey(String key) throws Throwable {
        String xPathForPurpose = "//nlb-transaction-card//div/div[2]//nlb-heading-text/*[contains(@class,'tw-text-gray-100')]";
        List<WebElement> webElementList = SelectByXpath.CreateElementsByXpath(xPathForPurpose);
        List<String> purposes = new ArrayList<>();
        for (int i = 0; i < 3; i++) {
            purposes.add(webElementList.get(i).getAttribute("innerText"));
        }
        DataManager.userObject.put(key, purposes);
    }

    @And("Assert latest transaction purposes from dashboard are not the same as in key {string}")
    public void assertLatestTransactionPurposesFromDashboardAreNotTheSameAsInKey(String key) throws Throwable {
        String xPathForPurpose = "//nlb-transaction-card//div/div[2]//nlb-heading-text/*[contains(@class,'tw-text-gray-100')]";
        List<WebElement> webElementList = SelectByXpath.CreateElementsByXpath(xPathForPurpose);
        List<String> purposes = new ArrayList<>();
        for (int i = 0; i < 3; i++) {
            purposes.add(webElementList.get(i).getAttribute("innerText"));
        }
        List<String> expectedPurposes = (List<String>) DataManager.userObject.get(key);
        Assert.assertNotEquals(expectedPurposes, purposes);
    }

    @And("Select category {string} with monthly limit {string}")
    public void selectCategoryWithMonthlyLimit(String category, String limit) throws Throwable {
        String xPathForCategoryInputField = "(//input)[1]";
        WebElement elementForCategoryInputField = SelectByXpath.CreateElementByXpath(xPathForCategoryInputField);
        hp.ClickOnElement(elementForCategoryInputField);
        String xPathForSelectedCategoryClick = "//*[normalize-space(text())='"+category+"']";
        WebElement elementForSelectedCategoryClick = SelectByXpath.CreateElementByXpath(xPathForSelectedCategoryClick);
        hp.ClickOnElement(elementForSelectedCategoryClick);

        String xPathForAmountInputField = "(//input)[2]";
        WebElement elementForAmountInputField = SelectByXpath.CreateElementByXpath(xPathForAmountInputField);
        ActionApiHelpers.EnterTextToElement(elementForAmountInputField,limit);

        String xPathForAddButton = "//*[normalize-space(text())='Add']";
        WebElement elementForAddButton = SelectByXpath.CreateElementByXpath(xPathForAddButton);
        hp.ClickOnElement(elementForAddButton);
    }

    @And("Wait for element by tag {string} and normalized text {string}")
    public void waitForElementByTagAndNormalizedText(String tag, String text) throws Throwable {
        String xPath = "//*[normalize-space(text())='"+text+"']";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        WaitHelpers.WaitForElement(element, "Element");
    }

    @And("Assert there are {string} budgets shown on dashboard")
    public void assertThereAreBudgetsShownOnDashboard(String budgetCount) throws Throwable {
        String xPath = "//nlb-budget-card";
        List<WebElement> elementList = SelectByXpath.CreateElementsByXpath(xPath);
        Assert.assertEquals(Integer.parseInt(budgetCount), elementList.size());
    }

    @And("Assert that budgets are shown correctly on dashboard")
    public void assertThatBudgetsAreShownCorrectlyOnDashboard() throws Throwable {
        List<String> budgets = (List<String>) DataManager.userObject.get("budgets_in_order");

        String educationBudgetTitle = "(//nlb-budget-card)[1]//*[contains(text(),'"+budgets.get(0)+"')]";
        WebElement elementForEducationBudgetTitle = SelectByXpath.CreateElementByXpath(educationBudgetTitle);
        Assert.assertTrue(elementForEducationBudgetTitle.isDisplayed());

        String shoppingBudgetTitle = "(//nlb-budget-card)[2]//*[contains(text(),'"+budgets.get(1)+"')]";
        WebElement elementForShoppingBudgetTitle = SelectByXpath.CreateElementByXpath(shoppingBudgetTitle);
        Assert.assertTrue(elementForShoppingBudgetTitle.isDisplayed());

        String cashBudgetTitle = "(//nlb-budget-card)[3]//*[contains(text(),'"+budgets.get(2)+"')]";
        WebElement elementForCashBudgetTitle = SelectByXpath.CreateElementByXpath(cashBudgetTitle);
        Assert.assertTrue(elementForCashBudgetTitle.isDisplayed());


        String educationBudgetLimit = "";
        if (budgets.get(0).equals("Education")) {
            educationBudgetLimit = "(//nlb-budget-card)[1]//*[contains(text(),'Limit')]/following-sibling::*[contains(text(),'400,00 EUR')]";
            WebElement elementForEducationBudgetLimit = SelectByXpath.CreateElementByXpath(educationBudgetLimit);
            Assert.assertTrue(elementForEducationBudgetLimit.isDisplayed());
        } else if (budgets.get(0).equals("Cash")) {
            educationBudgetLimit = "(//nlb-budget-card)[1]//*[contains(text(),'Limit')]/following-sibling::*[contains(text(),'500,00 EUR')]";
            WebElement elementForEducationBudgetLimit = SelectByXpath.CreateElementByXpath(educationBudgetLimit);
            Assert.assertTrue(elementForEducationBudgetLimit.isDisplayed());
        } else if (budgets.get(0).equals("Shopping")) {
            educationBudgetLimit = "(//nlb-budget-card)[1]//*[contains(text(),'Limit')]/following-sibling::*[contains(text(),'100,00 EUR')]";
            WebElement elementForEducationBudgetLimit = SelectByXpath.CreateElementByXpath(educationBudgetLimit);
            Assert.assertTrue(elementForEducationBudgetLimit.isDisplayed());
        }

        educationBudgetLimit = "";
        if (budgets.get(1).equals("Education")) {
            educationBudgetLimit = "(//nlb-budget-card)[2]//*[contains(text(),'Limit')]/following-sibling::*[contains(text(),'400,00 EUR')]";
            WebElement elementForEducationBudgetLimit = SelectByXpath.CreateElementByXpath(educationBudgetLimit);
            Assert.assertTrue(elementForEducationBudgetLimit.isDisplayed());
        } else if (budgets.get(1).equals("Cash")) {
            educationBudgetLimit = "(//nlb-budget-card)[2]//*[contains(text(),'Limit')]/following-sibling::*[contains(text(),'500,00 EUR')]";
            WebElement elementForEducationBudgetLimit = SelectByXpath.CreateElementByXpath(educationBudgetLimit);
            Assert.assertTrue(elementForEducationBudgetLimit.isDisplayed());
        } else if (budgets.get(1).equals("Shopping")) {
            educationBudgetLimit = "(//nlb-budget-card)[2]//*[contains(text(),'Limit')]/following-sibling::*[contains(text(),'100,00 EUR')]";
            WebElement elementForEducationBudgetLimit = SelectByXpath.CreateElementByXpath(educationBudgetLimit);
            Assert.assertTrue(elementForEducationBudgetLimit.isDisplayed());
        }

        educationBudgetLimit = "";
        if (budgets.get(2).equals("Education")) {
            educationBudgetLimit = "(//nlb-budget-card)[3]//*[contains(text(),'Limit')]/following-sibling::*[contains(text(),'400,00 EUR')]";
            WebElement elementForEducationBudgetLimit = SelectByXpath.CreateElementByXpath(educationBudgetLimit);
            Assert.assertTrue(elementForEducationBudgetLimit.isDisplayed());
        } else if (budgets.get(2).equals("Cash")) {
            educationBudgetLimit = "(//nlb-budget-card)[3]//*[contains(text(),'Limit')]/following-sibling::*[contains(text(),'500,00 EUR')]";
            WebElement elementForEducationBudgetLimit = SelectByXpath.CreateElementByXpath(educationBudgetLimit);
            Assert.assertTrue(elementForEducationBudgetLimit.isDisplayed());
        } else if (budgets.get(2).equals("Shopping")) {
            educationBudgetLimit = "(//nlb-budget-card)[3]//*[contains(text(),'Limit')]/following-sibling::*[contains(text(),'100,00 EUR')]";
            WebElement elementForEducationBudgetLimit = SelectByXpath.CreateElementByXpath(educationBudgetLimit);
            Assert.assertTrue(elementForEducationBudgetLimit.isDisplayed());
        }

    }

    @And("Delete budget {string}")
    public void deleteBudget(String text) throws Throwable {
        String xPathForDeleteButton = "//*[normalize-space(text())='"+text+"']/ancestor::nlb-heading-text/ancestor::div[1]/ancestor::div[1]/following-sibling::div//*[contains(@class,'icon-trash')]";
        hp.ClickOnElement(SelectByXpath.CreateElementByXpath(xPathForDeleteButton));

        String xPath = "//*[normalize-space(text())='Delete']";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        WaitHelpers.WaitForElement(element, "Element");
        hp.ClickOnElement(element);
    }

    @And("Wait for budget {string} to be deleted")
    public void waitForBudgetToBeDeleted(String text) throws Throwable {
        String xPath = "//*[normalize-space(text())='"+text+"']";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        WaitHelpers.WaitForElementToDisappear(element);
    }

    @And("Remember first {string} budgets under key {string}")
    public void rememberFirstBudgetsUnderKey(String count, String key) throws Throwable {
        WaitHelpers.waitForSeconds(10);
        int max = Integer.parseInt(count);
        String xPathForBudgetTitle = "//nlb-budget-card//nlb-heading-text//*[contains(@class,'heading-5')]";
        List<WebElement> webElementList = SelectByXpath.CreateElementsByXpath(xPathForBudgetTitle);
        List<String> budgets = new ArrayList<>();
        for (int i = 0; i < max; i++) {
            budgets.add(webElementList.get(i).getAttribute("innerText"));
        }
        DataManager.userObject.put(key, budgets);
    }

    @And("Click on normalized text {string}")
    public void clickOnNormalizedText(String text) throws Throwable {
        String xPath = "//*[normalize-space(text())='"+text+"']";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Remember purpose of first opened payment under key {string} in txt file")
    public void rememberPurposeOfFirstOpenedPaymentUnderKeyInTxtFile(String key) throws Throwable {
        String xPathForPurpose = "(//nlb-payment-item//*[contains(@class,'medium tw-text-gray-100')])[1]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPathForPurpose);
        String purpose = element.getAttribute("innerText");
        Utilities.saveTheValueToFile(purpose,key);
    }

    @And("Remember amount of first opened payment under key {string} in txt file")
    public void rememberAmountOfFirstOpenedPaymentUnderKeyInTxtFile(String key) throws Throwable {
        String xPathForAmount = "(//nlb-payment-item//h5//nlb-amount//div/div/following-sibling::div)[1]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPathForAmount);
        String amount = element.getAttribute("innerText");
        Utilities.saveTheValueToFile(amount,key);
    }

    @And("Remember creditor address of first opened payment under key {string} in txt file")
    public void rememberCreditorAddressOfFirstOpenedPaymentUnderKeyInTxtFile(String key) throws Throwable {
        String xPathForCreditorAddress = "(//*[normalize-space(text())='Creditor address']//following-sibling::div)[2]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPathForCreditorAddress);
        String creditorAddress = element.getAttribute("textContent");
        creditorAddress.replace(" ","");
        Utilities.saveTheValueToFile(creditorAddress,key);
    }

    @And("Remember {string} of first opened payment under key {string} in txt file")
    public void rememberOfFirstOpenedPaymentUnderKeyInTxtFile(String text, String key) throws Throwable {
        String xPathForCreditorInfo = "(//*[normalize-space(text())='"+text+"']//following-sibling::div)[2]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPathForCreditorInfo);
        String creditorAddress = element.getAttribute("innerText");
        Utilities.saveTheValueToFile(creditorAddress,key);
    }

    @And("Assert Recipient name is from txt file under key {string}")
    public void assertRecipientNameIsFromTxtFileUnderKey(String key) throws Throwable {
        String recipientName = Utilities.getDataFromTxtFileUnderKey(key);
        String xPathForRecipientName = "//nlb-upn-recipient-input-card//*[contains(text(),'"+recipientName+"')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPathForRecipientName);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert Recipient iban is from txt file under key {string}")
    public void assertRecipientIbanIsFromTxtFileUnderKey(String key) throws Throwable {
        String recipientName = Utilities.getDataFromTxtFileUnderKey(key);
        String xPathForRecipientName = "//nlb-upn-recipient-input-card//*[contains(text(),'"+recipientName+"')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPathForRecipientName);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert {string} is from txt file under key {string}")
    public void assertIsFromTxtFileUnderKey(String labelText, String key) throws Throwable {
        String expectedValue = Utilities.getDataFromTxtFileUnderKey(key);
        expectedValue = expectedValue.replace(" ","");
        String xPathForAssertElement = "//label[normalize-space(text())='"+labelText+"']//following-sibling::div//input";
        WebElement element = SelectByXpath.CreateElementByXpath(xPathForAssertElement);
        String actualValue = element.getAttribute("value");
        actualValue = actualValue.replace(" ","");
        System.out.println(expectedValue);
        System.out.println(actualValue);
        Assert.assertTrue(expectedValue.contains(actualValue) || actualValue.contains(expectedValue));
    }

    @And("Assert amount from txt file under key {string} and currency {string} in second payment screen")
    public void assertAmountFromTxtFileUnderKeyAndCurrencyInSecondPaymentScreen(String key, String expectedCurrency) throws Throwable {
        String expectedAmount = Utilities.getDataFromTxtFileUnderKey(key);
        String xPathForAmount = "(//nlb-input-amount-currency//input)[1]";
        String xPathForCurrency = "(//nlb-input-amount-currency//input)[2]";
        WebElement elementForAmount = SelectByXpath.CreateElementByXpath(xPathForAmount);
        WebElement elementForCurrency = SelectByXpath.CreateElementByXpath(xPathForCurrency);
        assertEquals(expectedAmount, elementForAmount.getAttribute("value"));
        assertEquals(expectedCurrency, elementForCurrency.getAttribute("value"));

    }

    @And("Assert second {string} in payment review is from txt file under key {string}")
    public void assertSecondInPaymentReviewIsFromTxtFileUnderKey(String field, String key) throws Throwable {
        String expectedValue = Utilities.getDataFromTxtFileUnderKey(key);
        String xPathForElementAssert = "(//span[contains(text(),'" + field + "')]//following-sibling::span)[2]";
        WebElement elementForAssert = SelectByXpath.CreateElementByXpath(xPathForElementAssert);
        assertEquals(expectedValue.replace(",",""), elementForAssert.getAttribute("textContent").replace(",",""));
    }

    @And("Assert Reference in payment review for einvoice is from txt file under key {string}")
    public void assertReferenceInPaymentReviewForEinvoiceIsFromTxtFileUnderKey(String key) throws Throwable {
        String expectedValue = Utilities.getDataFromTxtFileUnderKey(key);
        String xPathForElementAssert = "//span[contains(normalize-space(text()),'Reference')]//following-sibling::span";
        WebElement elementForAssert = SelectByXpath.CreateElementByXpath(xPathForElementAssert);
        assertTrue(elementForAssert.getAttribute("textContent").contains(expectedValue));
    }

    @And("Assert Purpose code in payment review for einvoice is from txt file under key {string}")
    public void assertPurposeCodeInPaymentReviewForEinvoiceIsFromTxtFileUnderKey(String key) throws Throwable {
        String expectedValue = Utilities.getDataFromTxtFileUnderKey(key);
        String xPathForElementAssert = "//span[contains(normalize-space(text()),'Purpose code')]//following-sibling::span";
        WebElement elementForAssert = SelectByXpath.CreateElementByXpath(xPathForElementAssert);
        assertTrue(elementForAssert.getAttribute("textContent").contains(expectedValue));
    }

    @And("Assert {string} in second step of UPN payment is disabled")
    public void assertInSecondStepOfUPNPaymentIsDisabled(String text) throws Throwable {
        String xPath = "//label[normalize-space(text())='"+text+"']//following-sibling::div//input";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        Assert.assertEquals("true",element.getAttribute("disabled"));
    }

    @And("Assert amount and currency in second payment screen are disabled")
    public void assertAmountAndCurrencyInSecondPaymentScreenAreDisabled() throws Throwable {
        String xPathForAmount = "(//nlb-input-amount-currency//input)[1]";
        String xPathForCurrency = "(//nlb-input-amount-currency//input)[2]";
        WebElement elementForAmount = SelectByXpath.CreateElementByXpath(xPathForAmount);
        WebElement elementForCurrency = SelectByXpath.CreateElementByXpath(xPathForCurrency);
        Assert.assertEquals("true",elementForAmount.getAttribute("disabled"));
        Assert.assertEquals("true",elementForCurrency.getAttribute("disabled"));
    }

    @And("Assert {string} dropdown in second step of UPN payment is disabled")
    public void assertDropdownInSecondStepOfUPNPaymentIsDisabled(String text) throws Throwable {
        String xPath = "//label[normalize-space(text())='"+text+"']//following-sibling::div//input[@readonly]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Check if authorization is needed and complete payment with account iban from key {string} amount from txt file under key {string} and currency {string} with message {string}")
    public void checkIfAuthorizationIsNeededAndCompletePaymentWithAccountIbanFromKeyAmountFromTxtFileUnderKeyAndCurrencyWithMessage(String ibanKey, String amountKey, String currency, String notif) throws Throwable {
        String iban = (String) DataManager.userObject.get(ibanKey);
        String amount = (String) DataManager.userObject.get(amountKey);
        rh.checkIfAuthIsNeededAndCompletePaymentFor(iban, amount, currency, notif);
    }

    @And("Assert that transaction amount in payment under key {string} from txt file is from key {string}")
    public void assertThatTransactionAmountInPaymentUnderKeyFromTxtFileIsFromKey(String key1, String key2) throws Throwable {
        String purpose = Utilities.getDataFromTxtFileUnderKey(key1);
        String expectedAmount = Utilities.getDataFromTxtFileUnderKey(key2);
        expectedAmount = "−"+expectedAmount;
        String xPathForPaymentAmount = "(//h5[contains(text(),'" + purpose + "')]//ancestor::nlb-payment-item//nlb-amount)[1]//*[contains(text(),'" + expectedAmount + "')]";
        WebElement elementForPaymentAmount = SelectByXpath.CreateElementByXpath(xPathForPaymentAmount);
        assertTrue(elementForPaymentAmount.isDisplayed());
    }

    @And("Assert progress bar is at {string}")
    public void assertProgressBarIsAt(String percent) throws Throwable {
        String xPath = "//nlb-progress-bar//span[@style='width: "+percent+";']";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert general information on personal data processing is correct in open savings account process")
    public void assertGeneralInformationOnPersonalDataProcessingIsCorrectInOpenSavingsAccountProcess() throws Throwable {
        String xPath = "//div[contains(@class, 'tw-text-gray-400') and contains(@class, 'body') and contains(text(), 'I have been provided with')]/a[contains(@class, 'semibold') and @href='https://www.nlb.si/varstvo-osebnih-podatkov' and text()='General information on personal data processing.']";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert button Confirm is disabled in open savings account process")
    public void assertButtonConfirmIsDisabledInOpenSavingsAccountProcess() throws Throwable {
        String xPath = "//nlb-button//button[@disabled]//*[normalize-space(text())='Confirm']";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Click on check box for I agree and confirm in open savings account process")
    public void clickOnCheckBoxForIAgreeAndConfirmInOpenSavingsAccountProcess() throws Throwable {
        String xPath = "//nlb-check-box//span[normalize-space(text())='I agree and confirm.']";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Enter amount {string} into amount input field in Open savings account process")
    public void enterAmountIntoAmountInputFieldInOpenSavingsAccountProcess(String amount) throws Throwable {
        String xPath = "//nlb-input-amount-currency//input[1]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        ActionApiHelpers.EnterTextToElement(element, amount);

    }

    @And("Assert currency is {string} in Open savings account process and cannot be changed")
    public void assertCurrencyIsInOpenSavingsAccountProcessAndCannotBeChanged(String currency) throws Throwable {
        String xPath = "//nlb-input-amount-currency//input[@readonly]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String actualValue = element.getAttribute("value");
        Assert.assertEquals(currency,actualValue);
    }

    @Given("Disable payments on mobile bank from mobile bank")
    public void disablePaymentsOnMobileBankFromMobileBank() throws Throwable {
        ma.disablePaymentsOnMobileBank();
    }

    @Then("Disable payments on web bank from web bank")
    public void disablePaymentsOnWebBankFromWebBank() throws Throwable {
        WebElement elementForWait = SelectByText.CreateElementByXpathText("Online bank");
        WaitHelpers.WaitForElement(elementForWait, "Element");

        String xPathbuttonForToggle = "(//nlb-settings-item//nlb-toggle-button-ios)[2]";
        WebElement elementForToggle = SelectByXpath.CreateElementByXpath(xPathbuttonForToggle);
        hp.ClickOnElement(elementForToggle);

        String xPathForBlockButton = "//*[normalize-space(text())='Block']";
        WebElement elementForBlockButton = SelectByXpath.CreateElementByXpath(xPathForBlockButton);
        hp.ClickOnElement(elementForBlockButton);
    }

    @And("For currency exchange rate {string} and source amount {string} calculate destination amount foreign")
    public void forCurrencyExchangeRateAndSourceAmountCalculateDestinationAmountForeign(String sellKey, String sourceAmountString) throws Throwable {
        String sellExchangeRateString = (String) DataManager.userObject.get(sellKey);
        sellExchangeRateString = sellExchangeRateString.replace(",", ".");
        Double sourceAmount = Double.parseDouble(sourceAmountString);
        Double sellExchangeRate = Double.parseDouble(sellExchangeRateString);
        Double destinationAmount = sourceAmount / sellExchangeRate;

        Double roundedValue = Math.round(destinationAmount * 100.0) / 100.0;
        //BigDecimal roundedValue3 = new BigDecimal(destinationAmount).setScale(2, RoundingMode.HALF_DOWN);
        //Double roundedValue = roundedValue3.doubleValue();
        DecimalFormat decimalFormat = new DecimalFormat("#.00");
        String expectedValue = decimalFormat.format(roundedValue);
        expectedValue = expectedValue.replace(".", ",");
        DataManager.userObject.put("destination_amount", expectedValue);

        String xPath = "(//input)[2]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String actualValue = element.getAttribute("value");

        //Assert.assertEquals(String.format("%.2f", expectedValueFinal),String.format("%.2f", actualValueFinal));
        System.out.println(expectedValue);
        System.out.println(actualValue);
        assertTrue(actualValue.contains(expectedValue.substring(0, 4)));
    }

    @And("Assert that received amount for first transaction in product screen is from key {string}")
    public void assertThatReceivedAmountForFirstTransactionInProductScreenIsFromKey(String key) throws Throwable {
        String expected = (String) DataManager.userObject.get(key);
        expected = expected.replace(".", ",");
        String xPath = "(//div//nlb-amount[contains(@class,'tw-text-incomingColor')])[1]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String actual = element.getAttribute("textContent");
        System.out.println(expected);
        System.out.println(actual);
        assertTrue(actual.contains(expected));
    }

    @And("Remember available balance in currency {string} under key {string}")
    public void rememberAvailableBalanceInCurrencyUnderKey(String currency, String key) throws Throwable {
        List<String> listOfBalance = rh.storeAllAvailableBalancesForAllCurrencies();

        String result = null;
        for (String amount : listOfBalance) {
            if (amount.endsWith(" " + currency)) {
                result = amount;
                break; // Stop searching after the first match
            }
        }

        result = result.replace(" "+currency+"","");
        result = result.replace(".","").replace(",",".");
        System.out.println(result);
        DataManager.userObject.put(key,result);
    }

    @And("Check if current balance is lowered by {string} using balance from key {string} for currency {string}")
    public void checkIfCurrentBalanceIsLoweredByUsingBalanceFromKeyForCurrency(String amountString, String key, String currency) throws Throwable {
        String previousAmountString = (String) DataManager.userObject.get(key);
        Double previousAmount = Double.parseDouble(previousAmountString);
        Double amount = Double.parseDouble(amountString);
        Double expectedAmount = previousAmount - amount;

        List<String> listOfBalance = rh.storeAllAvailableBalancesForAllCurrencies();

        String result = null;
        for (String amountS : listOfBalance) {
            if (amountS.endsWith(" " + currency)) {
                result = amountS;
                break; // Stop searching after the first match
            }
        }
        System.out.println(result);
        result = result.replace(" "+currency,"");
        result = result.replace(".","").replace(",",".");

        Double actualAmount = Double.parseDouble(result);
        System.out.printf("%.2f%n",expectedAmount);
        System.out.printf("%.2f%n",actualAmount);

        Assert.assertEquals(expectedAmount,actualAmount);
    }

    @And("Assert element by normalized text {string}")
    public void assertElementByNormalizedText(String text) throws Throwable {
        String xPath = "//*[normalize-space(text())='"+text+"']";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert element by normalized text {string} is not displayed")
    public void assertElementByNormalizedTextIsNotDisplayed(String text) throws Throwable {
        String xPath = "//*[normalize-space(text())='"+text+"']";
        By el = By.xpath(xPath);
        boolean messageExists = ActionApiHelpers.isElementDisplayedCustom(el, 5, 1000);
        assertFalse(messageExists);
    }

    @And("Remember creditor name of first opened payment under key {string} in txt file")
    public void rememberCreditorNameOfFirstOpenedPaymentUnderKeyInTxtFile(String key) throws Throwable {
        String xPath = "(//nlb-payment-item//*[contains(@class,'caption xs:subheadline xs:medium tw-text-gray-400')])[1]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String innerText = element.getAttribute("innerText");
        Utilities.saveTheValueToFile(innerText,key);
    }

    @And("Remember date of first opened payment under key {string} in txt file")
    public void rememberDateOfFirstOpenedPaymentUnderKeyInTxtFile(String key) throws Throwable {
        String xPath = "(//nlb-payment-item//*[contains(@class,'caption medium xs:subheadline tw-text-gray-400')])[1]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String innerText = element.getAttribute("innerText");
        Utilities.saveTheValueToFile(innerText,key);
    }

    @And("Assert element by text {string} has following sibling {string} that contains text from txt file under key {string} in attribute {string}")
    public void assertElementByTextHasFollowingSiblingThatContainsTextFromTxtFileUnderKeyInAttribute(String text, String followingSiblingTag, String key, String attribute) throws Throwable {
        String expectedValue = Utilities.getDataFromTxtFileUnderKey(key);
        String xPath = "(//*[normalize-space(text())='"+text+"']/following-sibling::"+followingSiblingTag+")[1]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String actualValue = element.getAttribute(attribute);
        System.out.println(expectedValue);
        System.out.println(actualValue);
        assertTrue(actualValue.contains(expectedValue));
    }

    @And("Assert element by text {string} has following sibling {string} that contains text from txt file under key {string} in attribute {string} inside modal")
    public void assertElementByTextHasFollowingSiblingThatContainsTextFromTxtFileUnderKeyInAttributeInsideModal(String text, String followingSiblingTag, String key, String attribute) throws Throwable {
        String expectedValue = Utilities.getDataFromTxtFileUnderKey(key);
        String xPath = "(//nlb-modal//*[normalize-space(text())='"+text+"']/following-sibling::"+followingSiblingTag+")[1]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String actualValue = element.getAttribute(attribute);
        System.out.println(expectedValue);
        System.out.println(actualValue);
        assertTrue(actualValue.contains(expectedValue));
    }

    @And("Assert current or previous month on page in Slovenian")
    public void assertCurrentOrPreviousMonthOnPageInSlovenian() {
        LocalDate today = LocalDate.now();
        LocalDate lastMonth = today.minusMonths(1);
        String currentMonth = rh.getSlovenianMonth(today.getMonthValue()) + " " + today.getYear();
        String previousMonth = rh.getSlovenianMonth(lastMonth.getMonthValue()) + " " + lastMonth.getYear();

        By elCurrentMonth = By.xpath("//*[normalize-space(text())='" + currentMonth + "']");
        By elPreviousMonth = By.xpath("//*[normalize-space(text())='" + previousMonth + "']");

        boolean currentMonthExists = !driver.findElements(elCurrentMonth).isEmpty();
        boolean previousMonthExists = !driver.findElements(elPreviousMonth).isEmpty();

        if (currentMonthExists || previousMonthExists) {
            System.out.println("✅ Prikazan je trenutni ili prethodni mesec.");
        } else {
            throw new AssertionError("❌ Nijedan od očekivanih meseci (" + currentMonth + " / " + previousMonth + ") nije prikazan na stranici.");
        }

    }

    @And("Assert e-invoice is shown correctly in e-invoice tab in payments screen")
    public void assertEInvoiceIsShownCorrectlyInEInvoiceTabInPaymentsScreen() throws Throwable {
        //icon
        String iconxPath = "(//nlb-payment-item//i[contains(@class, 'nlb-icon')])[1]";
        WebElement iconElement = SelectByXpath.CreateElementByXpath(iconxPath);
        //assertTrue(iconElement.is());
        //date
        String datexPath = "(//nlb-payment-item//div[contains(@class, 'subheadline')][1])[1]";
        WebElement dateElement = SelectByXpath.CreateElementByXpath(datexPath);
        assertTrue(dateElement.isDisplayed());
        assertTrue(dateElement.getAttribute("innerText").matches("^(0[1-9]|[1-2][0-9]|3[01])\\.(0[1-9]|1[0-2])\\.\\d{4}$"));
        //debtor
        String debtorxPath = "(//nlb-payment-item//div[contains(@class, 'caption')][2])[1]";
        WebElement debtorElement = SelectByXpath.CreateElementByXpath(debtorxPath);
        assertTrue(debtorElement.isDisplayed());
        assertFalse(debtorElement.getAttribute("innerText") == null && debtorElement.getAttribute("innerText").trim().isEmpty());
        //purpose
        String purposexPath = "(//nlb-payment-item//nlb-heading-text/h5[contains(@class, 'medium')])[1]";
        WebElement purposeElement = SelectByXpath.CreateElementByXpath(purposexPath);
        assertTrue(debtorElement.isDisplayed());
        assertFalse(purposeElement.getAttribute("innerText") == null && debtorElement.getAttribute("innerText").trim().isEmpty());
        //amount
        String amountxPath = "(//nlb-payment-item//nlb-amount/div/div[2])[1]";
        //String amountxPath = "(//nlb-transaction-card//nlb-amount/div/span[1])[1]";
        WebElement amountElement = SelectByXpath.CreateElementByXpath(amountxPath);
        assertTrue(amountElement.isDisplayed());
        assertTrue(amountElement.getAttribute("innerText").matches("(?:−)?(?:(?:0|[1-9]\\d{0,2})(?:.\\d{3})*),\\d{2}"));
        //currency
        String currencyxPath = "(//nlb-payment-item//nlb-amount//span[2])[1]";
        WebElement currencyElement = SelectByXpath.CreateElementByXpath(currencyxPath);
        assertTrue(currencyElement.isDisplayed());
        assertEquals("EUR", currencyElement.getAttribute("innerText"));
        //transaction details toggle button
        String trxDetailsxPath = "(//nlb-payment-item//nlb-icon/i[contains(@class,'icon-chevron-down')])[1]";
        WebElement trxDetailsElement = SelectByXpath.CreateElementByXpath(trxDetailsxPath);
        assertTrue(trxDetailsElement.isDisplayed());
        String paymentDuexPath = "(//div[contains(@class,'caption xs:subheadline xs:medium tw-text-gray-400 ellipsis')])[1]";
        WebElement paymentDueElement = SelectByXpath.CreateElementByXpath(paymentDuexPath);
        assertTrue(paymentDueElement.getAttribute("innerText").matches("Payment due date:\\d{2}\\.\\d{2}\\.\\d{4}"));
    }

    @And("Assert e-invoice dates are ordered correctly")
    public void assertEInvoiceDatesAreOrderedCorrectly() throws Throwable {
        String datexPath = "//nlb-payment-item//div[contains(@class, 'caption medium xs:subheadline tw-text-gray-400')][1]";
        List<WebElement> webElementList = SelectByXpath.CreateElementsByXpath(datexPath);
        List<String> listOfDates = new ArrayList<>();
        for (WebElement element : webElementList) {
            listOfDates.add(element.getAttribute("innerText"));
        }
        List<String> orderedListOfDates = listOfDates;

        Collections.sort(orderedListOfDates, new Comparator<String>() {
            DateFormat f = new SimpleDateFormat("dd.MM.yyyy");

            @Override
            public int compare(String o1, String o2) {
                try {
                    return f.parse(o1).compareTo(f.parse(o2));
                } catch (ParseException e) {
                    throw new IllegalArgumentException(e);
                }
            }
        });

        Collections.reverse(orderedListOfDates);
        assertEquals(orderedListOfDates, listOfDates);
    }

    @Then("Find E-invoice from Excel {string} columnName {string} and {string} and click on it")
    public void findEInvoiceFromExcelColumnNameAndAndClickOnIt(String rowindex, String columnName1, String columnName2) throws Throwable {
        String purpose = DataManager.getDataFromHashDatamap(rowindex,columnName1);
        String amount = DataManager.getDataFromHashDatamap(rowindex,columnName2);
        String xPath = "//div[@data-id and .//text()[contains(., '"+purpose+"')] and .//text()[contains(., '"+amount+"')]]";

        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Remember purpose of first opened payment under key {string}")
    public void rememberPurposeOfFirstOpenedPaymentUnderKey(String key) throws Throwable {
        String xPathForPurpose = "(//nlb-payment-item//*[contains(@class,'medium tw-text-gray-100')])[1]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPathForPurpose);
        String purpose = element.getAttribute("innerText");
        DataManager.userObject.put(key,purpose);
    }

    @And("Enter text from key {string} into first input field on page")
    public void enterTextFromKeyIntoFirstInputFieldOnPage(String key) throws Throwable {
        String xPath = "//input";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String text = (String) DataManager.userObject.get(key);
        ActionApiHelpers.EnterTextToElement(element,text);
    }

    @Then("Assert that transaction amount in payment under key {string} is from key {string}")
    public void assertThatTransactionAmountInPaymentUnderKeyIsFromKey(String key1, String key2) throws Throwable {
        String purpose = (String) DataManager.userObject.get(key1);
        String expectedAmount = Utilities.getDataFromTxtFileUnderKey(key2);
        String xPathForPaymentAmount = "(//h5[contains(text(),'" + purpose + "')]//ancestor::nlb-payment-item//nlb-amount)[1]//*[contains(text(),'" + expectedAmount + "')]";
        WebElement elementForPaymentAmount = SelectByXpath.CreateElementByXpath(xPathForPaymentAmount);
        assertTrue(elementForPaymentAmount.isDisplayed());
    }

    @And("Assert textarea has max character count of {string}")
    public void assertTextareaHasMaxCharacterCountOf(String max) throws Throwable {
        String xPath = "//textarea";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String actualValue = element.getAttribute("maxLength");
        Assert.assertEquals(max,actualValue);
    }

    @And("Enter text {string} into textarea")
    public void enterTextIntoTextarea(String text) throws Throwable {
        String xPath = "//textarea";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        ActionApiHelpers.EnterTextToElement(element,text);
    }

    @Then("Click on date {int} days in the past in second payment screen")
    public void clickOnDateDaysInThePastInSecondPaymentScreen(int daysInPast) throws Throwable {
        String dateInPast = ActionApiHelpers.getTodayDateMinusDaysInFormat(daysInPast, "dd.MM.YYYY");
        String date = hp.returnDateInSlovenianFormat(dateInPast);
        String xPath = "//*[@aria-label='" + date + "' and not(contains(@class, 'hidden'))]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Assert date {int} days in the past contains class {string} in descendant {string}")
    public void assertDateDaysInThePastContainsClassInDescendant(int daysInPast, String className, String descendantTag) throws Throwable {
        String dateInPast = ActionApiHelpers.getTodayDateMinusDaysInFormat(daysInPast, "dd.MM.YYYY");
        String date = hp.returnDateInSlovenianFormat(dateInPast);
        String xPath = "//*[@aria-label='"+date+"' and not(contains(@class, 'hidden'))]/"+descendantTag+"[contains(@class,'"+className+"')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert date {int} days in the past does not contain class {string} in descendant {string}")
    public void assertDateDaysInThePastDoesNotContainClassInDescendant(int daysInPast, String className, String descendantTag) throws Throwable {
        String dateInPast = ActionApiHelpers.getTodayDateMinusDaysInFormat(daysInPast, "dd.MM.YYYY");
        String date = hp.returnDateInSlovenianFormat(dateInPast);
        String xPath = "//*[@aria-label='"+date+"' and not(contains(@class, 'hidden'))]/"+descendantTag+"[not(contains(@class,'"+className+"'))]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Click on button Cancel to change profile data for {string}")
    public void clickOnButtonCancelToChangeProfileDataFor(String text) throws Throwable {
        if (text.equals("Email")) {
            WebElement element = SelectByXpath.CreateElementByXpath("(//*[contains(text(),'Cancel')])[1]");
            hp.ClickOnElement(element);
        } else if (text.equals("Mobile number")) {
            WebElement element = SelectByXpath.CreateElementByXpath("(//*[contains(text(),'Cancel')])[2]");
            hp.ClickOnElement(element);
        } else if (text.equals("Phone number")) {
            WebElement element = SelectByXpath.CreateElementByXpath("(//*[contains(text(),'Cancel')])[3]");
            hp.ClickOnElement(element);
        } else if (text.equals("Contact address")) {
            WebElement element = SelectByXpath.CreateElementByXpath("(//*[contains(text(),'Cancel')])[4]");
            hp.ClickOnElement(element);
        } else if (text.equals("Permanent address")) {
            WebElement element = SelectByXpath.CreateElementByXpath("(//*[contains(text(),'Cancel')])[5]");
            hp.ClickOnElement(element);
        }
    }

    @And("Wait for product details to load")
    public void waitForProductDetailsToLoad() throws InterruptedException {
        String xPath = "//h3[contains(text(), 'Financial details') and not(contains(@class,'xs:tw-hidden'))]";
        By element = SelectByXpath.CreateByElementByXpath(xPath);
        WaitHelpers.WaitForElement(element);
    }

    @And("Assert Product icon in Product details is displayed and has icon path from Excel {string} columnName {string}")
    public void assertProductIconInProductDetailsIsDisplayedAndHasIconPathFromExcelColumnName(String rowindex, String columnName) throws Throwable {
        String iconPath = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPath = "//nlb-product-icon/img";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
        assertEquals(iconPath, element.getAttribute("src"));
    }

    @And("Calculate the sum of all transactions under key {string}")
    public void calculateTheSumOfAllTransactionsUnderKey(String key) throws Throwable {
        String xPath = "//*[contains(@class,'bold heading-5 tw-flex tw-justify-end')]//div//div[2]";
        List<WebElement> elements = SelectByXpath.CreateElementsByXpath(xPath);
        BigDecimal sum = RoutineHelper.sumAmountsFromElements(elements);
        String formattedSum = RoutineHelper.formatAsSlovenianAmount(sum);
        DataManager.userObject.put(key, formattedSum);
    }

    @And("Assert amount sum for current month has value from key {string}")
    public void assertAmountSumForCurrentMonthHasValueFromKey(String key) throws Throwable {
        String expected = DataManager.userObject.get(key).toString();
        String amountxPath = "//*[@id=\"tabpanel-0\"]/section/nlb-selected-product-transactions/nlb-transactions-list-view/div/div[1]/div[1]/div/nlb-heading-text/div/nlb-amount/div/span[1]";
        WebElement amountElement = SelectByXpath.CreateElementByXpath(amountxPath);
        assertEquals(expected, amountElement.getAttribute("innerText"));
    }

    @And("Wait for element by tag {string} and text {string} with index {string}")
    public void waitForElementByTagAndTextWithIndex(String tag, String text, String index) throws InterruptedException {
        String xPath = "(//" + tag + "[text()='" + text + "'])[" + index + "]";
        By element = SelectByXpath.CreateByElementByXpath(xPath);
        WaitHelpers.WaitForElement(element);
    }

    @And("Assert Account owner in Savings Account details is from Excel {string} columnName {string}")
    public void assertAccountOwnerInSavingsAccountDetailsIsFromExcelColumnName(String rowindex, String columnName) throws Throwable {
        String currentEnv = DataManager.getDataFromHashDatamap("1", "currentEnv");
        if (currentEnv.equals("uat")){
            String ownerName = DataManager.getDataFromHashDatamap(rowindex, columnName);
            String xPath = "//nlb-product-details-card[2]//div[text() = 'Account owner']/ancestor::dt[1]/following-sibling::dd/div";
            WebElement element = SelectByXpath.CreateElementByXpath(xPath);
            assertTrue(element.isDisplayed());
            assertTrue(element.getAttribute("innerText").contains(ownerName));
        }
        if (currentEnv.equals("tst")){
            String ownerName = DataManager.getDataFromHashDatamap(rowindex, columnName);
            String xPath = "//nlb-product-details-card[2]//div[text() = 'Account owner']/ancestor::dt[1]/following-sibling::dd/div";
            WebElement element = SelectByXpath.CreateElementByXpath(xPath);
            assertTrue(element.isDisplayed());
            assertTrue(element.getAttribute("innerText").contains(ownerName));
        }
    }

    @And("Assert Account number in Savings Account details is from Excel {string} columnName {string}")
    public void assertAccountNumberInSavingsAccountDetailsIsFromExcelColumnName(String rowindex, String columnName) throws Throwable {
        String currentEnv = DataManager.getDataFromHashDatamap("1", "currentEnv");
        if (currentEnv.equals("uat")){
            String ownerName = DataManager.getDataFromHashDatamap(rowindex, columnName);
            String xPath = "//nlb-product-details-card[2]//div[text() = 'Account number']/ancestor::dt[1]/following-sibling::dd/div";
            WebElement element = SelectByXpath.CreateElementByXpath(xPath);
            assertTrue(element.isDisplayed());
            assertEquals(ownerName, element.getAttribute("innerText"));
        }
        if (currentEnv.equals("tst")){
            String ownerName = DataManager.getDataFromHashDatamap(rowindex, columnName);
            String xPath = "//nlb-product-details-card[2]//div[text() = 'Account number']/ancestor::dt[1]/following-sibling::dd/div";
            WebElement element = SelectByXpath.CreateElementByXpath(xPath);
            assertTrue(element.isDisplayed());
            assertEquals(ownerName, element.getAttribute("innerText"));
        }
    }

    @And("Assert Card details is displayed with index {int}")
    public void assertCardDetailsIsDisplayedWithIndex(int index) throws Throwable {
        String xPath = "//nlb-selected-product-details//nlb-product-details-card["+index+"]//nlb-heading-text/h3[not(contains(@class,'xs:tw-hidden'))]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
        assertEquals("Card details", element.getAttribute("innerText"));
    }

    @And("Assert Account number in Account detaisl is from Excel {string} columnName {string} for Savings account")
    public void assertAccountNumberInAccountDetaislIsFromExcelColumnNameForSavingsAccount(String rowindex, String columnName) {

    }

    @And("Assert Account number in Account details is from Excel {string} columnName {string} for Savings account")
    public void assertAccountNumberInAccountDetailsIsFromExcelColumnNameForSavingsAccount(String rowindex, String columnName) throws Throwable {
        String currentEnv = DataManager.getDataFromHashDatamap("1", "currentEnv");
        if (currentEnv.equals("uat")){
            String ownerName = DataManager.getDataFromHashDatamap(rowindex, columnName);
            String xPath = "//nlb-product-details-card[2]//div[text() = 'Account number']/ancestor::dt[1]/following-sibling::dd/div";
            WebElement element = SelectByXpath.CreateElementByXpath(xPath);
            assertTrue(element.isDisplayed());
            assertEquals(ownerName, element.getAttribute("innerText"));
        }
        if (currentEnv.equals("tst")){
            String ownerName = DataManager.getDataFromHashDatamap(rowindex, columnName);
            String xPath = "//nlb-product-details-card[2]//div[text() = 'Account number']/ancestor::dt[1]/following-sibling::dd/div";
            WebElement element = SelectByXpath.CreateElementByXpath(xPath);
            assertTrue(element.isDisplayed());
            assertEquals(ownerName, element.getAttribute("innerText"));
        }
    }

    @And("Assert Account owner in Account details is from Excel {string} columnName {string} for Savings account")
    public void assertAccountOwnerInAccountDetailsIsFromExcelColumnNameForSavingsAccount(String rowindex, String columnName) throws Throwable {
        String currentEnv = DataManager.getDataFromHashDatamap("1", "currentEnv");
        if (currentEnv.equals("uat")){
            String ownerName = DataManager.getDataFromHashDatamap(rowindex, columnName);
            String xPath = "//nlb-product-details-card[2]//div[text() = 'Account owner']/ancestor::dt[1]/following-sibling::dd/div";
            WebElement element = SelectByXpath.CreateElementByXpath(xPath);
            assertTrue(element.isDisplayed());
            assertTrue(element.getAttribute("innerText").contains(ownerName));
        }
        if (currentEnv.equals("tst")){
            String ownerName = DataManager.getDataFromHashDatamap(rowindex, columnName);
            String xPath = "//nlb-product-details-card[2]//div[text() = 'Account owner']/ancestor::dt[1]/following-sibling::dd/div";
            WebElement element = SelectByXpath.CreateElementByXpath(xPath);
            assertTrue(element.isDisplayed());
            assertTrue(element.getAttribute("innerText").contains(ownerName));
        }
    }

    @And("Assert element by tag {string} containing text {string} with index {string}")
    public void assertElementByTagContainingTextWithIndex(String tag, String text, String index) throws Throwable {
        String xPath = "(//" + tag + "[contains(text(),'" + text + "')])[" + index + "]";
        By elWait = SelectByXpath.CreateByElementByXpath(xPath);
        WaitHelpers.WaitForElement(elWait);

        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        assertTrue(element.isDisplayed());
    }

    @And("Assert {string} in payment review is {string} with tag {string}")
    public void assertInPaymentReviewIsWithTag(String text, String expectedValue, String tag) throws Throwable {
        String xPathForElementAssert = "//" + tag + "[contains(text(),'" + text + "')]//following-sibling::" + tag;
        WebElement elementForAssert = SelectByXpath.CreateElementByXpath(xPathForElementAssert);
        assertEquals(expectedValue, elementForAssert.getAttribute("textContent"));
    }

    @And("Assert second {string} in payment review contains text from excel {string} columnName {string}")
    public void assertSecondInPaymentReviewContainsTextFromExcelColumnName(String text, String rowindex, String columnName) throws Throwable {
        String expectedValue = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String xPathForElementAssert = "(//*[contains(text(),'" + text + "')]//following-sibling::*)[2]";
        WebElement elementForAssert = SelectByXpath.CreateElementByXpath(xPathForElementAssert);
        assertTrue(elementForAssert.getAttribute("textContent").contains(expectedValue));
    }

    @And("Assert element with tag {string} attribute {string} and attribute value {string} is not displayed")
    public void assertElementWithTagAttributeAndAttributeValueIsNotDisplayed(String tag, String attribute, String attributeValue) throws Throwable {
        String xPath = "//" + tag + "[@" + attribute + "='" + attributeValue + "']";
        By el = By.xpath(xPath);
        boolean messageExists = ActionApiHelpers.isElementDisplayedCustom(el, 5, 1000);
        assertFalse(messageExists);
    }

    @And("Assert element by id {string} is not displayed")
    public void assertElementByIdIsNotDisplayed(String id) throws Throwable {
        By el = By.xpath("//*[@id='" + id + "']");
        boolean messageExists = ActionApiHelpers.isElementDisplayedCustom(el, 5, 1000);
        assertFalse(messageExists);
    }

    @And("Assert element by tag {string} is not displayed")
    public void assertElementByTagIsNotDisplayed(String tag) throws Throwable {
        By el = By.xpath("//" + tag);
        boolean messageExists = ActionApiHelpers.isElementDisplayedCustom(el, 5, 1000);
        assertFalse(messageExists);
    }

    @And("Assert element by text {string} has following sibling {string} that contains text {string}")
    public void assertElementByTextHasFollowingSiblingThatContainsText(String text, String followingSiblingTag, String expectedValue) throws Throwable {
        String xPath = "(//*[normalize-space(text())='"+text+"']/following-sibling::"+followingSiblingTag+")[1]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        String actualValue = element.getAttribute("textContent");
        assertTrue(actualValue.contains(expectedValue));
    }

    @And("Assert that creditor swift bic code for opened transaction in product screen is {string}")
    public void assertThatCreditorSwiftBicCodeForOpenedTransactionInProductScreenIs(String expected) throws Throwable {
        String xPath = "(//*[not(contains(@class,'xs:tw-hidden'))]/*[text()='SWIFT BIC code']/following-sibling::*)[2]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        Assert.assertTrue(element.getAttribute("textContent").contains(expected));
    }

    @And("Click on up arrow on first transaction to collapse details")
    public void clickOnUpArrowOnFirstTransactionToCollapseDetails() throws Throwable {
        String xPath = "(//nlb-transaction-card//nlb-icon/i[contains(@class, 'icon-chevron-up')])[1]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Wait for tab {string} from main sidebar")
    public void waitForTabFromMainSidebar(String text) throws InterruptedException {
        String xPath = "//*[contains(@class,'tw-min-w-sidebarNavigation') and not(contains(@class, 'md:tw-hidden'))]//nlb-icon//following-sibling::*[contains(text(),'" + text + "')]";
        By element = By.xpath(xPath);
        WaitHelpers.WaitForElement(element);
    }

    @And("Assert Account owner in Account details is from Excel {string} columnName {string} for Deposit Account")
    public void assertAccountOwnerInAccountDetailsIsFromExcelColumnNameForDepositAccount(String rowindex, String columnName) throws Throwable {
        String currentEnv = DataManager.getDataFromHashDatamap("1", "currentEnv");
        if (currentEnv.equals("uat")){
            String ownerName = DataManager.getDataFromHashDatamap(rowindex, columnName);
            String xPath = "//nlb-product-details-card[2]//div[text() = 'Account owner']/ancestor::dt[1]/following-sibling::dd/div";
            WebElement element = SelectByXpath.CreateElementByXpath(xPath);
            assertTrue(element.isDisplayed());
            assertTrue(element.getAttribute("innerText").contains(ownerName));
        }
        if (currentEnv.equals("tst")){
            String ownerName = DataManager.getDataFromHashDatamap(rowindex, columnName);
            String xPath = "//nlb-product-details-card[2]//div[text() = 'Account owner']/ancestor::dt[1]/following-sibling::dd/div";
            WebElement element = SelectByXpath.CreateElementByXpath(xPath);
            assertTrue(element.isDisplayed());
            assertTrue(element.getAttribute("innerText").contains(ownerName));
        }
    }

    @And("Assert Account number in Account details is from Execl {string} columnName {string} for Deposit Account")
    public void assertAccountNumberInAccountDetailsIsFromExeclColumnNameForDepositAccount(String rowindex, String columnName) throws Throwable {
        String currentEnv = DataManager.getDataFromHashDatamap("1", "currentEnv");
        if (currentEnv.equals("uat")){
            String ownerName = DataManager.getDataFromHashDatamap(rowindex, columnName);
            String xPath = "//nlb-product-details-card[2]//div[text() = 'Account number']/ancestor::dt[1]/following-sibling::dd/div";
            WebElement element = SelectByXpath.CreateElementByXpath(xPath);
            assertTrue(element.isDisplayed());
            assertEquals(ownerName, element.getAttribute("innerText"));
        }
        if (currentEnv.equals("tst")){
            String ownerName = DataManager.getDataFromHashDatamap(rowindex, columnName);
            String xPath = "//nlb-product-details-card[2]//div[text() = 'Account number']/ancestor::dt[1]/following-sibling::dd/div";
            WebElement element = SelectByXpath.CreateElementByXpath(xPath);
            assertTrue(element.isDisplayed());
            assertEquals(ownerName, element.getAttribute("innerText"));
        }
    }

    @And("Enter text from Excel {string} columnName {string} with random deleted character into label with text {string} with following sibling {string} that has descendant {string}")
    public void enterTextFromExcelColumnNameWithRandomDeletedCharacterIntoLabelWithTextWithFollowingSiblingThatHasDescendant(String rowindex, String columnName, String labelText, String siblingTag, String descendantTag) throws Throwable {
        String xPathForAssertElement = "//label[text()='" + labelText + "']//following-sibling::" + siblingTag + "//" + descendantTag + "";
        WebElement elementForAssert = SelectByXpath.CreateElementByXpath(xPathForAssertElement);
        String textToEnter = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String partialName = rh.removeRandomLetter(textToEnter);
        hp.EnterTextToElement(elementForAssert, partialName);
    }

    @And("Enter text from Excel {string} columnName {string} with random letters permuted into label with text {string} with following sibling {string} that has descendant {string}")
    public void enterTextFromExcelColumnNameWithRandomLettersPermutedIntoLabelWithTextWithFollowingSiblingThatHasDescendant(String rowindex, String columnName, String labelText, String siblingTag, String descendantTag) throws Throwable {
        String xPathForAssertElement = "//label[text()='" + labelText + "']//following-sibling::" + siblingTag + "//" + descendantTag + "";
        WebElement elementForAssert = SelectByXpath.CreateElementByXpath(xPathForAssertElement);
        String textToEnter = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String partialName = rh.swapTwoRandomLettersInSameWord(textToEnter);
        hp.EnterTextToElement(elementForAssert, partialName);
    }

    @And("Enter text from Excel {string} columnName {string} with last letter changed into label with text {string} with following sibling {string} that has descendant {string}")
    public void enterTextFromExcelColumnNameWithLastLetterChangedIntoLabelWithTextWithFollowingSiblingThatHasDescendant(String rowindex, String columnName, String labelText, String siblingTag, String descendantTag) throws Throwable {
        String xPathForAssertElement = "//label[text()='" + labelText + "']//following-sibling::" + siblingTag + "//" + descendantTag + "";
        WebElement elementForAssert = SelectByXpath.CreateElementByXpath(xPathForAssertElement);
        String textToEnter = DataManager.getDataFromHashDatamap(rowindex, columnName);
        String partialName = rh.replaceLastLetterAorS(textToEnter);
        hp.EnterTextToElement(elementForAssert, partialName);
    }

    @And("Assert vop suggestion is correct using text from Excel {string} columnName {string}")
    public void assertVopSuggestionIsCorrectUsingTextFromExcelColumnName(String rowindex, String columnName) throws Throwable {
        String name = DataManager.getDataFromHashDatamap(rowindex,columnName);
        String text = " Did you mean "+name+"? ";
        WebElement element = SelectByText.CreateElementByXpathText(text);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert Reference in payment review has {string} and {string}")
    public void assertReferenceInPaymentReviewHasAnd(String first, String second) {
        By refLocator = By.xpath("//dt[normalize-space()='Reference']/following-sibling::dd[1][.//span[normalize-space()='"+first+"'] and .//span[normalize-space()='"+second+"']]");
        WebElement dd = driver.findElement(refLocator);
        String text = dd.getText().replace('\u00A0', ' ').trim();
        assertEquals("RF 45G72UUR", text);

    }

    @And("Assert filter {string} is shown")
    public void assertFilterIsShown(String text) throws Throwable {
        String xPath = "//*[@id='filters-content']//div[text()='"+text+"']";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert current or previous month on page")
    public void assertCurrentOrPreviousMonthOnPage() {
        LocalDate today = LocalDate.now();
        LocalDate lastMonth = today.minusMonths(1);
        String currentMonth = today.getMonth().getDisplayName(TextStyle.FULL, Locale.ENGLISH) + " " + today.getYear();
        String previousMonth = lastMonth.getMonth().getDisplayName(TextStyle.FULL, Locale.ENGLISH) + " " + lastMonth.getYear();

        By elCurrentMonth = By.xpath("//*[normalize-space(text())='" + currentMonth + "']");
        By elPreviousMonth = By.xpath("//*[normalize-space(text())='" + previousMonth + "']");

        boolean currentMonthExists = !driver.findElements(elCurrentMonth).isEmpty();
        boolean previousMonthExists = !driver.findElements(elPreviousMonth).isEmpty();

        if (currentMonthExists || previousMonthExists) {
            System.out.println("✅ Prikazan je trenutni ili prethodni mesec.");
        } else {
            throw new AssertionError("❌ Nijedan od očekivanih meseci (" + currentMonth + " / " + previousMonth + ") nije prikazan na stranici.");
        }
    }

    @And("Select filter option {string} for Document type invoices")
    public void selectFilterOptionForDocumentTypeInvoices(String text) throws Throwable {
        String xPath = "(//*[normalize-space(text())='"+text+"'])[2]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Click on info button for Payment limit amount")
    public void clickOnInfoButtonForPaymentLimitAmount() throws Throwable {
        String xPath = "(//nlb-icon[@name='icon-info'])[2]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Assert alert dialog popup after click on info button for Payment limit amount")
    public void assertAlertDialogPopupAfterClickOnInfoButtonForPaymentLimitAmount() throws Throwable {
        String xPath = "//div[@role='alertdialog']//*[normalize-space(text())='Payment limit amount']";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());

        String xPath2 = "//*[contains(text(),'Payment amount limit is set per account for all digital channels where SEPA credit transfers are executed (NLB Klik, Flik payments and third party providers apps).')]";
        WebElement element2 = SelectByXpath.CreateElementByXpath(xPath2);
        Assert.assertTrue(element2.isDisplayed());

        String xPath3 = "//*[@id=\"modal-message\"]/div[1]/div/div/div";
        WebElement element3 = SelectByXpath.CreateElementByXpath(xPath3);
        Assert.assertTrue(element3.getAttribute("textContent").contains("The payment limit restricts payments for all account users, but it does not affect own account transfers."));
    }

    @And("Assert Payment limit {string} has value {string} in product details screen")
    public void assertPaymentLimitHasValueInProductDetailsScreen(String text, String expectedText) throws Throwable {
        String xPath = "//dt[div[normalize-space()='"+text+"']]/following-sibling::dd[1]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        Assert.assertTrue(element.getAttribute("textContent").equals(expectedText));
    }

    @And("Click on button to change Daily Limit")
    public void clickOnButtonToChangeDailyLimit() throws Throwable {
        String xPath = "//span[normalize-space()='Daily limit']";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Enter amount {string} in payment limit field")
    public void enterAmountInPaymentLimitField(String amount) throws Throwable {
        String xPath = "//input[contains(@id,'amount-input')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        hp.EnterTextToElement(element,amount);
    }

    @And("Check if authorization is needed and complete payment limit change")
    public void checkIfAuthorizationIsNeededAndCompletePaymentLimitChange() throws Throwable {
        rh.checkIfAuthIsNeededAndCompletePaymentForPaymentLimitChange();
    }

    @And("Send key Backspace in field by contains id {string} till all is deleted")
    public void sendKeyBackspaceInFieldByContainsIdTillAllIsDeleted(String id) throws Throwable {
        String key = "BACK_SPACE";
        String xPath = "//input[contains(@id,'"+id+"')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        int n = element.getAttribute("value").length();
        rh.sendKeyNTimes(element, n, key);
    }

    @And("Click on button to change Transaction Limit")
    public void clickOnButtonToChangeTransactionLimit() throws Throwable {
        String xPath = "//span[normalize-space()='Transaction limit']";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        hp.ClickOnElement(element);
    }

    @And("Assert text {string} in element by contains id {string}")
    public void assertTextInElementByContainsId(String expected, String id) throws Throwable {
        String xPath = "//*[contains(@id,'"+id+"')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        Assert.assertTrue(element.getAttribute("value").contains(expected));
    }

    @And("Assert that foreign exchange rate for eur is not zero in opened transaction")
    public void assertThatForeignExchangeRateForEurIsNotZeroInOpenedTransaction() {
        By badFxRate = By.xpath(
                "(//nlb-transaction-card[.//*[@role='button' and @aria-expanded='true']]"
                        + "//*[@id='accordion-content']"
                        + "//dt[normalize-space(.)='Foreign Exchange rate']"
                        + "/following-sibling::dd[1]"
                        + "//div[normalize-space(.)='1 EUR = 0.0000EUR'])"
                        + ")[last()]"
        );
        boolean notPresent = driver.findElements(badFxRate).isEmpty();
        assertTrue("Unexpected FX rate present: 1 EUR = 0.0000EUR", notPresent);
    }


    //ALEKSA
    @When("Assert sidebar is displayed by contains class {string}")
    public void assertSidebarIsDisplayedByContainsClass(String className) throws Throwable {
        String xPath = "//*[contains(@class, '" + className + "')]";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }

    @And("Assert user profile icon at the right top corner of the screen")
    public void assertUserProfileIconAtTheRightTopCornerOfTheScreen() throws Throwable {
        String xPath = "//*[@aria-label='User profile']";
        WebElement element = SelectByXpath.CreateElementByXpath(xPath);
        Assert.assertTrue(element.isDisplayed());
    }


    

    @And("Assert for first element in product screen {string}")
    public void assertForFirstElementInProductScreen(String text) {
        String className = "tw-hidden phonelg:tw-block xs:tw-hidden caption";
        String xPath = "(//*[contains(@class, '" + className + "')])[1]";

        WebElement account = driver.findElement(By.xpath(xPath));
        Assert.assertEquals(text,account.getText());

    }


    @And("Click Radio Button with index {string}")
    public void clickRadioButtonWithIndex(String favorite_acc) {
        String secondRadioXPath = "(//div[@role='radiogroup']//input[@type='radio'])[2]";

        // Klik na drugi radio button
        WebElement secondRadio = driver.findElement(By.xpath(secondRadioXPath));


        // XPath koji nalazi broj računa za taj isti (drugi) element
        String accountNumberXPath = "(//div[@role='radiogroup']//span[@class='tw-text-gray-400 subheadline'])[1]";
        WebElement accountNumberElement = driver.findElement(By.xpath(accountNumberXPath));
        String accountNumber = accountNumberElement.getText();
        secondRadio.click();

        System.out.println("Drugi radio button kliknut. Broj računa: " + accountNumber);
        DataManager.userObject.put(favorite_acc, accountNumber);
    }

    @And("Assert for first element in product screen")
    public void assertForFirstElementInProductScreen() {
        // XPath koji nalazi prvi broj računa u listi
        String xPath = "(//span[@class='tw-hidden xs:tw-block subheadline'])[1]";

        WebElement account = driver.findElement(By.xpath(xPath));

        String accountNumber = account.getText().trim();
        System.out.println("Broj računa koji je prvi u listi: " + accountNumber);

        // Poređenje sa očekivanim iz DataManager-a
        Assert.assertEquals(DataManager.userObject.get("favorite_acc"), accountNumber);
    }

    @Then("Accounts are displayed in the following order:")
    public void accountsAreDisplayedInTheFollowingOrder(io.cucumber.datatable.DataTable dataTable) {
        List<String> expectedOrder = dataTable.asList();

        List<WebElement> accountTitles = driver.findElements(
                By.cssSelector("nlb-product-card .product-type, nlb-product-card h3, nlb-product-card .title")
        );

        List<String> normalizedOrder = accountTitles.stream()
                .map(WebElement::getText)
                .map(String::trim)
                .map(text -> {
                    String lower = text.toLowerCase();
                    if (lower.contains("payment account"))
                        return "Current accounts";
                    else if (lower.contains("visa"))
                        return "Cards";
                    else if (lower.contains("deposit"))
                        return "Savings accounts";
                    else if (lower.contains("loan"))
                        return "Loans";
                    else
                        return "Other";
                })
                .collect(Collectors.toList());

        int lastIndex = -1;
        for (String expected : expectedOrder) {
            int index = normalizedOrder.indexOf(expected);
            if (index == -1) {
                // Sekcija ne postoji, preskačemo
                continue;
            }
            Assert.assertTrue("Section '" + expected + "' is out of order", index >= lastIndex);
            lastIndex = index;
        }
        System.out.println(normalizedOrder);
    }



    @And("Assert element by contains label {string} is displayed")
    public void assertElementByContainsLabelIsDisplayed(String label) throws Throwable{
        String xPath = "//div[@aria-label='" + label + "']";
        By waitEl = SelectByXpath.CreateByElementByXpath(xPath);
        WaitHelpers.WaitForElement(waitEl);

        WebElement element = SelectByXpath.CreateElementByXpathTagAndAriaLabel("div",label);
        assertTrue(element.isDisplayed());
    }

    @And("Click on right arrow {string} times")
    public void click_on_right_arrow_times(String times) throws Throwable {
        int numberOfTimes = Integer.parseInt(times);

        //save active slide data for verifying change
        String activeSlideXpath = "//swiper-slide[contains(@class,'swiper-slide-active')]";
        WebElement initialSlide = SelectByXpath.CreateElementByXpath(activeSlideXpath);
        String initialContent = initialSlide.getText().trim();

        String xpath = "//div[contains(@class,'swiper-button-next')]//button";
        WebElement rightArrow = SelectByXpath.CreateElementByXpath(xpath);

        for (int i = 0; i < numberOfTimes; i++) {
            System.out.println("➡️ Click #" + (i + 1));
            hp.ClickOnElement(rightArrow, "Right Arrow");
            Thread.sleep(1000);
            //verify change
            String newActiveSlideXpath = "//swiper-slide[contains(@class,'swiper-slide-active')]";
            WebElement newSlide = SelectByXpath.CreateElementByXpath(newActiveSlideXpath);
            String newContent = newSlide.getText().trim();

            assertNotSame(initialContent, newContent);
            activeSlideXpath = "//swiper-slide[contains(@class,'swiper-slide-active')]";
        }
    }

    @And("Click on left arrow {string} times")
    public void clickOnLeftArrow(String times) throws Throwable {
        int numberOfTimes = Integer.parseInt(times);

        //save active slide data for verifying change
        String activeSlideXpath = "//swiper-slide[contains(@class,'swiper-slide-active')]";
        WebElement initialSlide = SelectByXpath.CreateElementByXpath(activeSlideXpath);
        String initialContent = initialSlide.getText().trim();

        String xpath = "//div[contains(@class,'swiper-button-prev')]//button";
        WebElement leftArrow = SelectByXpath.CreateElementByXpath(xpath);

        for (int i = 0; i < numberOfTimes; i++) {
            System.out.println("⬅️ Click #" + (i + 1));
            hp.ClickOnElement(leftArrow, "Left Arrow");
            Thread.sleep(1000);

            //verify change
            String newActiveSlideXpath = "//swiper-slide[contains(@class,'swiper-slide-active')]";
            WebElement newSlide = SelectByXpath.CreateElementByXpath(newActiveSlideXpath);
            String newContent = newSlide.getText().trim();

            assertNotSame(initialContent, newContent);
            activeSlideXpath = "//swiper-slide[contains(@class,'swiper-slide-active')]";
        }
    }

    @And("Clicks on show all on Latest transactions")
    public void clicksOnShowAllOnLatestTransactions() throws Throwable {
        String xpath = "//button[contains(.,'Show all')]";
        WebElement showAllButton = SelectByXpath.CreateElementByXpath(xpath);

        hp.ClickOnElement(showAllButton, "Show all");
    }

    @And("Assert element by text {string} index {string} is displayed")
    public void assertElementByTextIndexIsDisplayed(String text, String index) throws Throwable {
        By elWait = SelectByText.CreateByElementByTextIndex(text,index);
        WaitHelpers.WaitForElement(elWait);

        WebElement element = SelectByText.CreateElementByXpathIndex(text,index);
        assertTrue(element.isDisplayed());
    }

    @And("Assert account number with index {string} is displayed")
    public void assertAccountNumberWithIndexIsDisplayed(String index) throws Throwable {
        String xpath="(//div[contains(@class, 'tw-bg-primaryColor')]//div[normalize-space()])[" + index + "]";
        By elWait = SelectByXpath.CreateByElementByXpath(xpath);
        WaitHelpers.WaitForElement(elWait);

        WebElement element = SelectByXpath.CreateElementByXpath(xpath);
        assertTrue(element.isDisplayed());


    }
}