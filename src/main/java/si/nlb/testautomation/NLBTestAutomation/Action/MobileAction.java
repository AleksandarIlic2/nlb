package si.nlb.testautomation.NLBTestAutomation.Action;

import io.appium.java_client.MobileElement;
import io.appium.java_client.TouchAction;
import io.appium.java_client.android.AndroidDriver;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.StaleElementReferenceException;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;
import si.nlb.testautomation.NLBTestAutomation.Core.Base;
import si.nlb.testautomation.NLBTestAutomation.Core.BaseMobile;
import si.nlb.testautomation.NLBTestAutomation.Data.DataManager;
import si.nlb.testautomation.NLBTestAutomation.Helpers.Log;
import si.nlb.testautomation.NLBTestAutomation.Selectors.SelectByXpath;
import si.nlb.testautomation.NLBTestAutomation.Selectors.SelectMobileByXpath;
import si.nlb.testautomation.NLBTestAutomation.Wait.WaitHelpers;

import java.awt.*;
import java.awt.datatransfer.Clipboard;
import java.awt.datatransfer.DataFlavor;
import java.io.IOException;
import java.sql.SQLOutput;

import static io.appium.java_client.touch.offset.PointOption.point;

public class MobileAction {

    //region - Element present -
    /**
     * Check if element is present
     * @param xpath Element xpath for check
     * @return true/false
     * @throws Throwable
     * Move to Action helper
     */
    public boolean isElementPresent(By xpath, int cycle, int wtime) throws Throwable {
        for (int i = 1; i <= cycle; i = i + 1) {
            try {
                WebElement element = BaseMobile.driver.findElement(xpath);
                boolean displayed = element.isDisplayed();

                if (displayed) {
                    return true;
                }
            } catch (NoSuchElementException e) {

            }
            Thread.sleep(wtime);
        }
        return false;
    }

    /**
     * Check if element is present
     * @param xpath Element xpath for check
     * @return true/false
     * @throws Throwable
     * Move to Action helper
     */
    public boolean isElementPresent(By xpath) throws Throwable {
        return isElementPresent(xpath, 25, 1000);
    }

    /**
     * Check if element is present with short wait time
     * @param xpath Element xpath for check
     * @return true/false
     * @throws Throwable
     * Move to action helper
     */
    public boolean isElementPresentShortly(By xpath) throws Throwable {
        return isElementPresent(xpath, 5, 50);
    }

    /**
     * Check if element is present
     * @param element WebElement for check
     * @return true/false
     * @throws Throwable
     * Move to Action helper
     */
    public boolean isElementPresent(WebElement element, int cycle, int wtime) throws Throwable {
        for (int i = 1; i <= cycle; i = i + 1) {
            try {
                boolean displayed = element.isDisplayed();

                if (displayed) {
                    return true;
                }
            } catch (NoSuchElementException e) {

            }
            Thread.sleep(wtime);
        }
        return false;
    }

    public boolean isElementPresent(WebElement element) throws Throwable {
        return isElementPresent(element, 10, 1000);
    }

    public Boolean isPresentBehindElement(By by) {
        Boolean a = true;
        if (!BaseMobile.driver.findElement(by).getAttribute("visible").equals("false")) {
            a = false;
        }
        return a;
    }

    /**
     * Check if element is present
     * @param element WebElement for check
     * @return true - not present, false - present
     * @throws Throwable
     * Move to Action helper
     */
    public boolean isNotElementPresent(By element) {
        try {
            BaseMobile.driver.findElement(element);
            return false;
        } catch (java.util.NoSuchElementException | org.openqa.selenium.NoSuchElementException e) {
            // Log.info("!!!!!!!!! Element " + element + " doesn't exists !!!!!!!!!!!!!!!!");
            return true;
        }
    }

    //endregion - Element present -

    //region - Base methods -
    /**
     * Opens application
     * @throws Throwable
     */
    public void goToApp() throws Throwable {
        unlockIfDeviceIsLocked();
        //Thread.sleep(5000);
    }

    /**
     * Goes back.
     * @throws InterruptedException
     */
    public void goBackToApp() throws InterruptedException {
        BaseMobile.driver.navigate().back();
        Thread.sleep(5000);
    }
    /**
     * Unlock device
     * @throws InterruptedException
     * Move to Action Helpers
     */
    public void unlockIfDeviceIsLocked() throws InterruptedException {
        Thread.sleep(3000);
        if (BaseMobile.testPlatform.equals("Android")) {
            if (((AndroidDriver) BaseMobile.driver).isDeviceLocked())
                ((AndroidDriver) BaseMobile.driver).unlockDevice();
        }
        if (BaseMobile.testPlatform.equals("iOS")) {

        }
    }

    /**
     * Click on element by xpath
     * @param xpath - Element xpath
     * @throws Exception
     * Move to Action helpers
     */
    public void clickElement(By xpath) throws Exception {
        BaseMobile.waitVar = new WebDriverWait(BaseMobile.driver, 90);
        boolean elementPresent = BaseMobile.waitVar.until(ExpectedConditions.elementToBeClickable(xpath)).isEnabled();
        try {
            if (elementPresent) {
                Thread.sleep(2000);
                BaseMobile.driver.findElement(xpath).click();
                Log.info("!!!!!!!!!!!!!!!!!!!!!!!!! Tap on " + xpath.toString() + " !!!!!!!!!!!!!!!!!!!!!!!!!");
            }
        } catch (StaleElementReferenceException elementUpdated) {
            BaseMobile.driver.findElement(xpath);
            BaseMobile.driver.findElement(xpath).click();
        } catch (Exception e) {
            System.out.println("Exception! - could not click on link: " + e.toString());
            throw (e);
        }
        Thread.sleep(3000);
    }

    /**
     * Enters text in parameter @text to element by xpath
     * @param text - Text to enter.
     * @param id - Element ID
     * @throws Throwable
     * Change logic
     */
    public void inputTextInFieldById(String text, String id) throws Throwable {
        By element = SelectMobileByXpath.createElementById(id);
        WaitHelpers.waitForElement(element, 30);
        Assert.assertTrue(isElementPresent(element));
        clickElement(element);
        WebElement el = BaseMobile.driver.findElement(element);
        BaseMobile.driver.getKeyboard().sendKeys(text);
        //clearInputField(el);
        //el.sendKeys(text);
    }

    public String getAttribute(By element, String attrib){
        WaitHelpers.waitForElement(element, 3);
        String value = BaseMobile.driver.findElement(element).getAttribute(attrib);
        return value.trim();
    }

    public void getMobileOTP(String pin) throws Throwable {

        //if(DataManager.isDeviceVirtual.equals("1")){
            goToApp();
            String currentEnv = DataManager.getDataFromHashDatamap("1","currentEnv");
            if (currentEnv.equals("tst")){
                String xPathForContinueToApp = "//*[@text='Continue to the app']";
                By elForContinueToApp = SelectMobileByXpath.createByXpath(xPathForContinueToApp);
                //WaitHelpers.WaitForElement(elForContinueToApp);
                clickElement(elForContinueToApp);

                String xPathForOneTimePassword = "//*[@text='One-time password']";
                By elOneTimePassword = SelectMobileByXpath.createByXpath(xPathForOneTimePassword);
                //WaitHelpers.WaitForElement(elOneTimePassword);
                clickElement(elOneTimePassword);
            } else {
                String xPathForOneTimePassword = "//*[@text='One-time password']";
                By elOneTimePassword = SelectMobileByXpath.createByXpath(xPathForOneTimePassword);
                //WaitHelpers.WaitForElement(elOneTimePassword);
                clickElement(elOneTimePassword);
            }

            String xPathEnterPin = "//*[@text='Enter PIN']";
            By elEnterPin = SelectMobileByXpath.createByXpath(xPathEnterPin);
            //WaitHelpers.WaitForElement(elEnterPin);

            //BaseMobile.driver.getKeyboard().sendKeys(pin);
            BaseMobile.driver.getKeyboard().sendKeys("1");
            WaitHelpers.waitForSeconds(3);
            BaseMobile.driver.getKeyboard().sendKeys("3");
            WaitHelpers.waitForSeconds(3);
            BaseMobile.driver.getKeyboard().sendKeys("7");
            WaitHelpers.waitForSeconds(3);
            BaseMobile.driver.getKeyboard().sendKeys("9");

            String xPathForOTPScreen = "//*[@text='One-time password']";
            By elForOTPScreen = SelectMobileByXpath.createByXpath(xPathForOTPScreen);
            //WaitHelpers.WaitForElement(elForOTPScreen);
            if (DataManager.isDeviceVirtual.equals("0")){
                String xPathForOTP = "//*[@resource-id='nlb-card-container']/android.widget.TextView[1]";
                MobileElement element = (MobileElement) BaseMobile.driver.findElement(SelectMobileByXpath.createByXpath(xPathForOTP));
                String otpCode = element.getText().replaceAll(" ","");
                DataManager.userObject.put("OTP", otpCode);
            } else{
                String xPathForOTP = "//*[@resource-id='nlb-card-container']//android.widget.Button[1]";
                By elForOTP = SelectMobileByXpath.createByXpath(xPathForOTP);
                clickElement(elForOTP);

                String cliboard = (String) Toolkit.getDefaultToolkit().getSystemClipboard().getData(DataFlavor.stringFlavor);
                String otpCode = cliboard.replaceAll(" ","");
                DataManager.userObject.put("OTP", otpCode);
            }

            BaseMobile.teardown();

        //}
        //else{
            /*goToApp();
            String xPath = "//*[@text='One-time password OTP']";
            By element = SelectMobileByXpath.createByXpath(xPath);
            clickElement(element);
            inputTextInFieldById(pin, "background");
            WaitHelpers.waitForSeconds(5);
            By element1 = SelectMobileByXpath.createByXpath("//*[@resource-id='co.infinum.nlb.uat:id/textOtpValue']");
            String otp = BaseMobile.driver.findElement(element1).getAttribute("text");
            String otpCode = otp.replaceAll(" ","");
            DataManager.userObject.put("OTP", otpCode);
            BaseMobile.driver.quit();*/
        //}
    }

    public void blockAccessToWebFromMobile() throws Throwable {
        goToApp();
        String xPathForLogin = "//*[@text='Login to NLB Klik - BETA']";
        By elementForLogin = SelectMobileByXpath.createByXpath(xPathForLogin);
        clickElement(elementForLogin);
        inputTextInFieldById("1379","background");
        By elementSetings = SelectMobileByXpath.createElementById("product_summary_toolbar_icon");
        clickElement(elementSetings);
        String xPathForSecurityAndPrivacy = "//*[@text='Security and privacy']";
        By elementForSecurityAndPrivacy = SelectMobileByXpath.createByXpath(xPathForSecurityAndPrivacy);
        clickElement(elementForSecurityAndPrivacy);
        String xPathForBlockWebAndMobileBank = "//*[@text='Block mobile or online bank']";
        By elementForBlockWebAndMobileBank = SelectMobileByXpath.createByXpath(xPathForBlockWebAndMobileBank);
        clickElement(elementForBlockWebAndMobileBank);
        By elementForSwitch = SelectMobileByXpath.createElementById("webSwitch");
        clickElement(elementForSwitch);
        WaitHelpers.waitForSeconds(5);
        BaseMobile.teardown();
        WaitHelpers.waitForSeconds(5);
        BaseMobile.createDriver();
    }

    public void getMobileOTPWhileAppAlreadyOpened(String pin) throws Throwable {
        goToApp();
        new TouchAction(BaseMobile.driver).tap(point(1015,255)).perform();
        String cliboard = (String) Toolkit.getDefaultToolkit().getSystemClipboard().getData(DataFlavor.stringFlavor);
        String otpCode = cliboard.replaceAll(" ","");
        DataManager.userObject.put("OTP", otpCode);
    }

    public void completePayment(String accountIban, String amount, String currency) throws Throwable {
        BaseMobile.createDriver();
        goToApp();

        String currentEnv = DataManager.getDataFromHashDatamap("1","currentEnv");
        if (currentEnv.equals("tst")){
            String xPathForContinueToApp = "//*[@text='Continue to the app']";
            By elForContinueToApp = SelectMobileByXpath.createByXpath(xPathForContinueToApp);
            clickElement(elForContinueToApp);
        }

        String xPathForSecurityConfirmations = "//*[@text='Security confirmations']";
        By elForSecurityConfirmations = SelectMobileByXpath.createByXpath(xPathForSecurityConfirmations);
        clickElement(elForSecurityConfirmations);

        String xPathEnterPin = "//*[@text='Enter PIN']";
        By elEnterPin = SelectMobileByXpath.createByXpath(xPathEnterPin);
        Assert.assertTrue(isElementPresent(elEnterPin));

        BaseMobile.driver.getKeyboard().sendKeys("1");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("3");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("7");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("9");

        //String accountIbanWithNoSpaces = accountIban.replaceAll(" ","");
        /*String xPathForIban = "//*[@text='IBAN:']//following-sibling::*[@text='"+accountIbanWithNoSpaces+"']";
        System.out.println(BaseMobile.driver.getPageSource());
        By elForIban = SelectMobileByXpath.createByXpath(xPathForIban);
        WaitHelpers.WaitForElement(elForIban);
        Assert.assertTrue(isElementPresent(elForIban));

        String xPathForAmount = "//*[@text='Amount:']//following-sibling::*[@text='"+amount+"']";
        By elForAmount = SelectMobileByXpath.createByXpath(xPathForAmount);
        Assert.assertTrue(isElementPresent(elForAmount));

        String xPathForCurrency = "//*[@text='Currency:']//following-sibling::*[@text='"+currency+"']";
        By elForCurrency = SelectMobileByXpath.createByXpath(xPathForCurrency);
        Assert.assertTrue(isElementPresent(elForCurrency));*/



        String xPathForConfirmButton = "//*[@text='Confirm']";
        By elForConfirmButton = SelectMobileByXpath.createByXpath(xPathForConfirmButton);
        Assert.assertTrue(isElementPresent(elForConfirmButton));

        String pageSource = BaseMobile.driver.getPageSource();
        Assert.assertTrue(pageSource.contains("text=\"IBAN:\""));
        Assert.assertTrue(pageSource.contains(accountIban));
        Assert.assertTrue(pageSource.contains("text=\"Amount:\""));
        //Assert.assertTrue(pageSource.contains("text=\""+amount+"\""));
        Assert.assertTrue(pageSource.contains("text=\"Currency:\""));
        Assert.assertTrue(pageSource.contains("text=\""+currency+"\""));

        clickElement(elForConfirmButton);

        //String xPathForConfirmedPayment = "//*[@text='You confirmed payment submission. You can return to NLB Klik on web to check submission.']";
        //By elForConfirmedPayment = SelectMobileByXpath.createByXpath(xPathForConfirmedPayment);
        //Assert.assertTrue(isElementPresent(elForConfirmedPayment));

        BaseMobile.teardown();
    }

    public void completeStandingOrder(String accountIban, String amount, String currency) throws Throwable {
        BaseMobile.createDriver();
        goToApp();

        String currentEnv = DataManager.getDataFromHashDatamap("1","currentEnv");
        if (currentEnv.equals("tst")){
            String xPathForContinueToApp = "//*[@text='Continue to the app']";
            By elForContinueToApp = SelectMobileByXpath.createByXpath(xPathForContinueToApp);
            clickElement(elForContinueToApp);
        }

        //String xPathForContinueToApp = "//*[@text='Continue to the app']";
        //By elForContinueToApp = SelectMobileByXpath.createByXpath(xPathForContinueToApp);
        //clickElement(elForContinueToApp);

        String xPathForSecurityConfirmations = "//*[@text='Security confirmations']";
        By elForSecurityConfirmations = SelectMobileByXpath.createByXpath(xPathForSecurityConfirmations);
        clickElement(elForSecurityConfirmations);

        String xPathEnterPin = "//*[@text='Enter PIN']";
        By elEnterPin = SelectMobileByXpath.createByXpath(xPathEnterPin);
        Assert.assertTrue(isElementPresent(elEnterPin));

        BaseMobile.driver.getKeyboard().sendKeys("1");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("3");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("7");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("9");

        //String accountIbanWithNoSpaces = accountIban.replaceAll(" ","");
        /*String xPathForIban = "//*[@text='IBAN:']//following-sibling::*[@text='"+accountIbanWithNoSpaces+"']";
        System.out.println(BaseMobile.driver.getPageSource());
        By elForIban = SelectMobileByXpath.createByXpath(xPathForIban);
        WaitHelpers.WaitForElement(elForIban);
        Assert.assertTrue(isElementPresent(elForIban));

        String xPathForAmount = "//*[@text='Amount:']//following-sibling::*[@text='"+amount+"']";
        By elForAmount = SelectMobileByXpath.createByXpath(xPathForAmount);
        Assert.assertTrue(isElementPresent(elForAmount));

        String xPathForCurrency = "//*[@text='Currency:']//following-sibling::*[@text='"+currency+"']";
        By elForCurrency = SelectMobileByXpath.createByXpath(xPathForCurrency);
        Assert.assertTrue(isElementPresent(elForCurrency));*/



        String xPathForConfirmButton = "//*[@text='Confirm']";
        By elForConfirmButton = SelectMobileByXpath.createByXpath(xPathForConfirmButton);
        Assert.assertTrue(isElementPresent(elForConfirmButton));

        String pageSource = BaseMobile.driver.getPageSource();
        Assert.assertTrue(pageSource.contains("text=\"Account:\""));
        Assert.assertTrue(pageSource.contains(accountIban));
        Assert.assertTrue(pageSource.contains("text=\"Amount:\""));
        Assert.assertTrue(pageSource.contains("text=\""+amount.replace(".", ",")+" "+currency+"\""));
        //BUG, fali purpose
        //Assert.assertTrue(pageSource.contains("text=\"Purpose:\""));
        Assert.assertTrue(pageSource.contains("text=\"New standing order\""));

        clickElement(elForConfirmButton);

        //String xPathForConfirmedPayment = "//*[@text='You confirmed payment submission. You can return to NLB Klik on web to check submission.']";
        //By elForConfirmedPayment = SelectMobileByXpath.createByXpath(xPathForConfirmedPayment);
        //Assert.assertTrue(isElementPresent(elForConfirmedPayment));

        BaseMobile.teardown();
    }

    public void completePaymentUsingWrongPin() throws Throwable {
        BaseMobile.createDriver();
        goToApp();

        /*String xPathForContinueToApp = "//*[@text='Continue to the app']";
        By elForContinueToApp = SelectMobileByXpath.createByXpath(xPathForContinueToApp);
        clickElement(elForContinueToApp);*/

        String xPathForSecurityConfirmations = "//*[@text='Security confirmations']";
        By elForSecurityConfirmations = SelectMobileByXpath.createByXpath(xPathForSecurityConfirmations);
        clickElement(elForSecurityConfirmations);

        String xPathEnterPin = "//*[@text='Enter PIN']";
        By elEnterPin = SelectMobileByXpath.createByXpath(xPathEnterPin);
        Assert.assertTrue(isElementPresent(elEnterPin));

        BaseMobile.driver.getKeyboard().sendKeys("1");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("1");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("1");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("1");

        String xPathForErrorMessage = "//*[@text='Nothing to confirm or wrong PIN.']";
        By elForErrorMessage = SelectMobileByXpath.createByXpath(xPathForErrorMessage);
        Assert.assertTrue(isElementPresent(elForErrorMessage));

        BaseMobile.teardown();
    }

    public void completePaymentAfterExpiration() throws Throwable {
        BaseMobile.createDriver();
        goToApp();

        /*String xPathForContinueToApp = "//*[@text='Continue to the app']";
        By elForContinueToApp = SelectMobileByXpath.createByXpath(xPathForContinueToApp);
        clickElement(elForContinueToApp);*/

        String xPathForSecurityConfirmations = "//*[@text='Security confirmations']";
        By elForSecurityConfirmations = SelectMobileByXpath.createByXpath(xPathForSecurityConfirmations);
        clickElement(elForSecurityConfirmations);

        String xPathEnterPin = "//*[@text='Enter PIN']";
        By elEnterPin = SelectMobileByXpath.createByXpath(xPathEnterPin);
        Assert.assertTrue(isElementPresent(elEnterPin));

        BaseMobile.driver.getKeyboard().sendKeys("1");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("3");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("7");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("9");

        String xPathForErrorMessage = "//*[@text='Nothing to confirm or wrong PIN.']";
        By elForErrorMessage = SelectMobileByXpath.createByXpath(xPathForErrorMessage);
        Assert.assertTrue(isElementPresent(elForErrorMessage));

        BaseMobile.teardown();
    }

    public void rejectPayment() throws Throwable {
        BaseMobile.createDriver();
        goToApp();

//        String xPathForContinueToApp = "//*[@text='Continue to the app']";
//        By elForContinueToApp = SelectMobileByXpath.createByXpath(xPathForContinueToApp);
//        clickElement(elForContinueToApp);

        String xPathForSecurityConfirmations = "//*[@text='Security confirmations']";
        By elForSecurityConfirmations = SelectMobileByXpath.createByXpath(xPathForSecurityConfirmations);
        clickElement(elForSecurityConfirmations);

        String xPathEnterPin = "//*[@text='Enter PIN']";
        By elEnterPin = SelectMobileByXpath.createByXpath(xPathEnterPin);
        Assert.assertTrue(isElementPresent(elEnterPin));

        BaseMobile.driver.getKeyboard().sendKeys("1");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("3");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("7");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("9");

        String xPathForRejectButton = "//*[@text='Reject']";
        By elForRejectButton = SelectMobileByXpath.createByXpath(xPathForRejectButton);
        clickElement(elForRejectButton);

        String xPathForSuccessRejection = "//*[@text='Request for payment was rejected. You can return to NLB Klik on web.']";
        By elForSuccessRejection = SelectMobileByXpath.createByXpath(xPathForSuccessRejection);
        Assert.assertTrue(isElementPresent(elForSuccessRejection));

        String xPathForCloseButton = "//*[@text='Close']";
        By elForCloseButton = SelectMobileByXpath.createByXpath(xPathForCloseButton);
        clickElement(elForCloseButton);

        String xPathForLoginToNLB = "//*[@text='Login to NLB Klik']";
        By elForLoginToNLB = SelectMobileByXpath.createByXpath(xPathForLoginToNLB);
        Assert.assertTrue(isElementPresent(elForLoginToNLB));

        BaseMobile.teardown();
    }

    public void completePayment(String accountIban) throws Throwable {
        BaseMobile.createDriver();
        goToApp();

        /*String xPathForContinueToApp = "//*[@text='Continue to the app']";
        By elForContinueToApp = SelectMobileByXpath.createByXpath(xPathForContinueToApp);
        clickElement(elForContinueToApp);*/

        String xPathForSecurityConfirmations = "//*[@text='Security confirmations']";
        By elForSecurityConfirmations = SelectMobileByXpath.createByXpath(xPathForSecurityConfirmations);
        clickElement(elForSecurityConfirmations);

        String xPathEnterPin = "//*[@text='Enter PIN']";
        By elEnterPin = SelectMobileByXpath.createByXpath(xPathEnterPin);
        Assert.assertTrue(isElementPresent(elEnterPin));

        BaseMobile.driver.getKeyboard().sendKeys("1");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("3");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("7");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("9");

        /*String accountIbanWithNoSpaces = accountIban.replaceAll(" ","");
        String xPathForIban = "//*[@text='IBAN:']//following-sibling::*[@text='"+accountIbanWithNoSpaces+"']";
        By elForIban = SelectMobileByXpath.createByXpath(xPathForIban);
        Assert.assertTrue(isElementPresent(elForIban));*/

        String xPathForConfirmButton = "//*[@text='Confirm']";
        By elForConfirmButton = SelectMobileByXpath.createByXpath(xPathForConfirmButton);
        clickElement(elForConfirmButton);

        /*String xPathForConfirmedPayment = "//*[@text='You confirmed payment submission. You can return to NLB Klik on web to check submission.']";
        By elForConfirmedPayment = SelectMobileByXpath.createByXpath(xPathForConfirmedPayment);
        Assert.assertTrue(isElementPresent(elForConfirmedPayment));*/

        BaseMobile.teardown();
    }

    public void completeContactChange() throws Throwable {
        BaseMobile.createDriver();
        goToApp();

        String env = DataManager.getDataFromHashDatamap("1","currentEnv");

        if (env.equals("tst")){
            String xPathForContinueToApp = "//*[@text='Continue to the app']";
            By elForContinueToApp = SelectMobileByXpath.createByXpath(xPathForContinueToApp);
            clickElement(elForContinueToApp);
        }

        String xPathForSecurityConfirmations = "//*[@text='Security confirmations']";
        By elForSecurityConfirmations = SelectMobileByXpath.createByXpath(xPathForSecurityConfirmations);
        clickElement(elForSecurityConfirmations);

        String xPathEnterPin = "//*[@text='Enter PIN']";
        By elEnterPin = SelectMobileByXpath.createByXpath(xPathEnterPin);
        Assert.assertTrue(isElementPresent(elEnterPin));

        BaseMobile.driver.getKeyboard().sendKeys("1");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("3");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("7");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("9");

        String xPathForConfirmButton = "//*[@text='Confirm']";
        By elForConfirmButton = SelectMobileByXpath.createByXpath(xPathForConfirmButton);
        clickElement(elForConfirmButton);

        BaseMobile.teardown();
    }

    public void getNewMobileOTP(String pin) throws Throwable {
        BaseMobile.createDriver();
        goToApp();

        String xPathForOneTimePassword = "//*[@text='One-time password']";
        By elOneTimePassword = SelectMobileByXpath.createByXpath(xPathForOneTimePassword);
        clickElement(elOneTimePassword);

        String xPathEnterPin = "//*[@text='Enter PIN']";
        By elEnterPin = SelectMobileByXpath.createByXpath(xPathEnterPin);
        BaseMobile.driver.getKeyboard().sendKeys("1");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("3");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("7");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("9");

        String xPathForOTPScreen = "//*[@text='One-time password']";
        By elForOTPScreen = SelectMobileByXpath.createByXpath(xPathForOTPScreen);

        if (DataManager.isDeviceVirtual.equals("0")){
            String xPathForOTP = "//*[@resource-id='nlb-card-container']/android.widget.TextView[1]";
            MobileElement element = (MobileElement) BaseMobile.driver.findElement(SelectMobileByXpath.createByXpath(xPathForOTP));
            String otpCode = element.getText().replaceAll(" ","");
            DataManager.userObject.put("OTP", otpCode);
        } else{
            String xPathForOTP = "//*[@resource-id='nlb-card-container']//android.widget.Button[1]";
            By elForOTP = SelectMobileByXpath.createByXpath(xPathForOTP);
            clickElement(elForOTP);

            String cliboard = (String) Toolkit.getDefaultToolkit().getSystemClipboard().getData(DataFlavor.stringFlavor);
            String otpCode = cliboard.replaceAll(" ","");
            DataManager.userObject.put("OTP", otpCode);
        }

        BaseMobile.teardown();
    }

    public void enableLoginToWebBank() throws Throwable {
        BaseMobile.createDriver();
        goToApp();

        String xPathLoginToNLBKlik = "//*[@text='Login to NLB Klik']";
        By elLoginToNLBKlik = SelectMobileByXpath.createByXpath(xPathLoginToNLBKlik);
        clickElement(elLoginToNLBKlik);

        String xPathEnterPin = "//*[@text='Enter PIN']";
        By elEnterPin = SelectMobileByXpath.createByXpath(xPathEnterPin);
        BaseMobile.driver.getKeyboard().sendKeys("1");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("3");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("7");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("9");

        String xPathForProfile = "//android.view.View[@content-desc=\"Default Icon\"]";
        By elProfile = SelectMobileByXpath.createByXpath(xPathForProfile);
        clickElement(elProfile);

        String xPathForSecurityAndPrivacy = "//*[@text='Security and privacy']";
        By elForSecurityAndPrivacy = SelectMobileByXpath.createByXpath(xPathForSecurityAndPrivacy);
        clickElement(elForSecurityAndPrivacy);

        String xPathForBlockMobileOrOnlineBank = "//*[@text='Block mobile or online bank']";
        By elForBlockMobileOrOnlineBank = SelectMobileByXpath.createByXpath(xPathForBlockMobileOrOnlineBank);
        clickElement(elForBlockMobileOrOnlineBank);

        String xPathForWebToggle = "//*[@resource-id='nlb-online-bank-switch']//android.view.View[1]";
        By elForWebToggle = SelectMobileByXpath.createByXpath(xPathForWebToggle);
        clickElement(elForWebToggle);

        BaseMobile.teardown();
    }

    public void checkIfUserIsBlocked() throws Throwable {
        BaseMobile.createDriver();
        goToApp();

        String xPathLoginToNLBKlik = "//*[@text='Login to NLB Klik']";
        By elLoginToNLBKlik = SelectMobileByXpath.createByXpath(xPathLoginToNLBKlik);
        clickElement(elLoginToNLBKlik);

        String xPathEnterPin = "//*[@text='Enter PIN']";
        By elEnterPin = SelectMobileByXpath.createByXpath(xPathEnterPin);
        BaseMobile.driver.getKeyboard().sendKeys("1");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("3");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("7");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("9");

        String xPathForBlockMessage = "//*[@text='Login to mobile bank is disabled.']";
        By elForBlockMessage = SelectMobileByXpath.createByXpath(xPathForBlockMessage);
        Assert.assertTrue(isElementPresent(elForBlockMessage));

        BaseMobile.teardown();
    }

    public void checkIfUserIsUnblocked() throws Throwable {
        BaseMobile.createDriver();
        goToApp();

        String xPathLoginToNLBKlik = "//*[@text='Login to NLB Klik']";
        By elLoginToNLBKlik = SelectMobileByXpath.createByXpath(xPathLoginToNLBKlik);
        clickElement(elLoginToNLBKlik);

        String xPathEnterPin = "//*[@text='Enter PIN']";
        By elEnterPin = SelectMobileByXpath.createByXpath(xPathEnterPin);
        BaseMobile.driver.getKeyboard().sendKeys("1");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("3");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("7");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("9");

        String xPathForBlockMessage = "//*[@text='All transactions']";
        By elForBlockMessage = SelectMobileByXpath.createByXpath(xPathForBlockMessage);
        Assert.assertTrue(isElementPresent(elForBlockMessage));

        BaseMobile.teardown();
    }

    public void checkIfUserIsBlockedFromPaymentsOnMobileBank() throws Throwable {
        BaseMobile.createDriver();
        goToApp();

        String xPathLoginToNLBKlik = "//*[@text='Login to NLB Klik']";
        By elLoginToNLBKlik = SelectMobileByXpath.createByXpath(xPathLoginToNLBKlik);
        clickElement(elLoginToNLBKlik);

        String xPathEnterPin = "//*[@text='Enter PIN']";
        By elEnterPin = SelectMobileByXpath.createByXpath(xPathEnterPin);
        BaseMobile.driver.getKeyboard().sendKeys("1");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("3");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("7");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("9");
        WaitHelpers.waitForSeconds(3);

        /*String xPathForBlockMessage = "//*[@text='Latest transactions']";
        By elForBlockMessage = SelectMobileByXpath.createByXpath(xPathForBlockMessage);
        Assert.assertTrue(isElementPresent(elForBlockMessage));*/

        String xPathForPayButton = "//android.view.View[@content-desc=\"Pay\"]";
        By elForPayButton = SelectMobileByXpath.createByXpath(xPathForPayButton);
        clickElement(elForPayButton);

        String xPathForPayOrTransferButton = "//android.view.View[@content-desc=\"Pay or transfer\"]";
        By elForPayOrTransferButton = SelectMobileByXpath.createByXpath(xPathForPayOrTransferButton);
        clickElement(elForPayOrTransferButton);

        String xPathForInfoMessage = "//*[@text='Payments are blocked']";
        By elForInfoMessage = SelectMobileByXpath.createByXpath(xPathForInfoMessage);
        Assert.assertTrue(isElementPresent(elForInfoMessage));

        BaseMobile.teardown();
    }

    public void checkIfUserIsUnBlockedFromPaymentsOnMobileBank() throws Throwable {
        BaseMobile.createDriver();
        goToApp();

        String xPathLoginToNLBKlik = "//*[@text='Login to NLB Klik']";
        By elLoginToNLBKlik = SelectMobileByXpath.createByXpath(xPathLoginToNLBKlik);
        clickElement(elLoginToNLBKlik);

        String xPathEnterPin = "//*[@text='Enter PIN']";
        By elEnterPin = SelectMobileByXpath.createByXpath(xPathEnterPin);
        BaseMobile.driver.getKeyboard().sendKeys("1");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("3");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("7");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("9");
        WaitHelpers.waitForSeconds(3);

        /*String xPathForBlockMessage = "//*[@text='Latest transactions']";
        By elForBlockMessage = SelectMobileByXpath.createByXpath(xPathForBlockMessage);
        Assert.assertTrue(isElementPresent(elForBlockMessage));*/

        String xPathForPayButton = "//android.view.View[@content-desc=\"Pay\"]";
        By elForPayButton = SelectMobileByXpath.createByXpath(xPathForPayButton);
        clickElement(elForPayButton);

        String xPathForPayOrTransferButton = "//android.view.View[@content-desc=\"Pay or transfer\"]";
        By elForPayOrTransferButton = SelectMobileByXpath.createByXpath(xPathForPayOrTransferButton);
        clickElement(elForPayOrTransferButton);

        String xPathForInputIban = "//*[@resource-id='nlb-input-account-number']";
        By elForInputIban = SelectMobileByXpath.createByXpath(xPathForInputIban);
        Assert.assertTrue(isElementPresent(elForInputIban));

        BaseMobile.teardown();
    }

    public void disableLoginToMobileBank() throws Throwable {
        BaseMobile.createDriver();
        goToApp();

        String xPathLoginToNLBKlik = "//*[@text='Login to NLB Klik']";
        By elLoginToNLBKlik = SelectMobileByXpath.createByXpath(xPathLoginToNLBKlik);
        clickElement(elLoginToNLBKlik);

        String xPathEnterPin = "//*[@text='Enter PIN']";
        By elEnterPin = SelectMobileByXpath.createByXpath(xPathEnterPin);
        BaseMobile.driver.getKeyboard().sendKeys("1");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("3");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("7");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("9");

        String xPathForProfile = "//android.view.View[@content-desc=\"Default Icon\"]";
        By elProfile = SelectMobileByXpath.createByXpath(xPathForProfile);
        clickElement(elProfile);

        String xPathForSecurityAndPrivacy = "//*[@text='Security and privacy']";
        By elForSecurityAndPrivacy = SelectMobileByXpath.createByXpath(xPathForSecurityAndPrivacy);
        clickElement(elForSecurityAndPrivacy);

        String xPathForBlockMobileOrOnlineBank = "//*[@text='Block mobile or online bank']";
        By elForBlockMobileOrOnlineBank = SelectMobileByXpath.createByXpath(xPathForBlockMobileOrOnlineBank);
        clickElement(elForBlockMobileOrOnlineBank);
        WaitHelpers.waitForSeconds(3);

        //String xPathForWebToggle = "//*[@resource-id='nlb-mobile-bank-switch']";
        String xPathForWebToggle = "//*[@text='Mobile bank']";
        By elForWebToggle = SelectMobileByXpath.createByXpath(xPathForWebToggle);
        clickElement(elForWebToggle);
        WaitHelpers.waitForSeconds(3);

        String xPathForYesButton = "//*[@text='Block']";
        By elForYesButton = SelectMobileByXpath.createByXpath(xPathForYesButton);
        clickElement(elForYesButton);
        System.out.println("Kliknuo sam na Block");
        WaitHelpers.waitForSeconds(3);

        BaseMobile.teardown();
    }

    public void disableLoginToWebBank() throws Throwable {
        BaseMobile.createDriver();
        goToApp();

        String xPathLoginToNLBKlik = "//*[@text='Login to NLB Klik']";
        By elLoginToNLBKlik = SelectMobileByXpath.createByXpath(xPathLoginToNLBKlik);
        clickElement(elLoginToNLBKlik);

        String xPathEnterPin = "//*[@text='Enter PIN']";
        By elEnterPin = SelectMobileByXpath.createByXpath(xPathEnterPin);
        BaseMobile.driver.getKeyboard().sendKeys("1");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("3");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("7");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("9");

        String xPathForProfile = "//android.view.View[@content-desc=\"Default Icon\"]";
        By elProfile = SelectMobileByXpath.createByXpath(xPathForProfile);
        clickElement(elProfile);

        String xPathForSecurityAndPrivacy = "//*[@text='Security and privacy']";
        By elForSecurityAndPrivacy = SelectMobileByXpath.createByXpath(xPathForSecurityAndPrivacy);
        clickElement(elForSecurityAndPrivacy);

        String xPathForBlockMobileOrOnlineBank = "//*[@text='Block mobile or online bank']";
        By elForBlockMobileOrOnlineBank = SelectMobileByXpath.createByXpath(xPathForBlockMobileOrOnlineBank);
        clickElement(elForBlockMobileOrOnlineBank);

        String xPathForWebToggle = "//*[@resource-id='nlb-online-bank-switch']//android.view.View[1]";
        By elForWebToggle = SelectMobileByXpath.createByXpath(xPathForWebToggle);
        clickElement(elForWebToggle);

        BaseMobile.teardown();
    }

    public void disablePaymentsOnWebBank() throws Throwable {
        BaseMobile.createDriver();
        goToApp();

        String xPathLoginToNLBKlik = "//*[@text='Login to NLB Klik']";
        By elLoginToNLBKlik = SelectMobileByXpath.createByXpath(xPathLoginToNLBKlik);
        clickElement(elLoginToNLBKlik);

        String xPathEnterPin = "//*[@text='Enter PIN']";
        By elEnterPin = SelectMobileByXpath.createByXpath(xPathEnterPin);
        BaseMobile.driver.getKeyboard().sendKeys("1");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("3");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("7");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("9");

        String xPathForProfile = "//android.view.View[@content-desc=\"Default Icon\"]";
        By elProfile = SelectMobileByXpath.createByXpath(xPathForProfile);
        clickElement(elProfile);

        String xPathForPaymentsButton = "//*[@text='Enable or disable payments']";
        By elPaymentsButton = SelectMobileByXpath.createByXpath(xPathForPaymentsButton);
        clickElement(elPaymentsButton);

        String xPathForWebToggle = "//*[@resource-id='nlb-online-bank-switch']//android.view.View[1]";
        By elForWebToggle = SelectMobileByXpath.createByXpath(xPathForWebToggle);
        clickElement(elForWebToggle);

        BaseMobile.teardown();
    }

    public void enablePaymentsOnWebBank() throws Throwable {
        BaseMobile.createDriver();
        goToApp();

        String xPathLoginToNLBKlik = "//*[@text='Login to NLB Klik']";
        By elLoginToNLBKlik = SelectMobileByXpath.createByXpath(xPathLoginToNLBKlik);
        clickElement(elLoginToNLBKlik);

        String xPathEnterPin = "//*[@text='Enter PIN']";
        By elEnterPin = SelectMobileByXpath.createByXpath(xPathEnterPin);
        BaseMobile.driver.getKeyboard().sendKeys("1");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("3");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("7");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("9");

        String xPathForProfile = "//android.view.View[@content-desc=\"Default Icon\"]";
        By elProfile = SelectMobileByXpath.createByXpath(xPathForProfile);
        clickElement(elProfile);

        String xPathForPaymentsButton = "//*[@text='Enable or disable payments']";
        By elPaymentsButton = SelectMobileByXpath.createByXpath(xPathForPaymentsButton);
        clickElement(elPaymentsButton);

        String xPathForWebToggle = "//*[@resource-id='nlb-online-bank-switch']//android.view.View[1]";
        By elForWebToggle = SelectMobileByXpath.createByXpath(xPathForWebToggle);
        clickElement(elForWebToggle);

        BaseMobile.teardown();
    }

    public void disablePaymentsOnMobileBank() throws Throwable {
        BaseMobile.createDriver();
        goToApp();

        String xPathLoginToNLBKlik = "//*[@text='Login to NLB Klik']";
        By elLoginToNLBKlik = SelectMobileByXpath.createByXpath(xPathLoginToNLBKlik);
        clickElement(elLoginToNLBKlik);

        String xPathEnterPin = "//*[@text='Enter PIN']";
        By elEnterPin = SelectMobileByXpath.createByXpath(xPathEnterPin);
        BaseMobile.driver.getKeyboard().sendKeys("1");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("3");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("7");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("9");

        String xPathForProfile = "//android.view.View[@content-desc=\"Default Icon\"]";
        By elProfile = SelectMobileByXpath.createByXpath(xPathForProfile);
        clickElement(elProfile);

        String xPathForPaymentsButton = "//*[@text='Enable or disable payments']";
        By elPaymentsButton = SelectMobileByXpath.createByXpath(xPathForPaymentsButton);
        clickElement(elPaymentsButton);

        String xPathForWebToggle = "//*[@resource-id='nlb-mobile-bank-switch']//android.view.View[1]";
        By elForWebToggle = SelectMobileByXpath.createByXpath(xPathForWebToggle);
        clickElement(elForWebToggle);

        BaseMobile.teardown();
    }

    public void completePaymentLimitChange() throws Throwable {
        BaseMobile.createDriver();
        goToApp();

        String currentEnv = DataManager.getDataFromHashDatamap("1","currentEnv");
        if (currentEnv.equals("tst")){
            String xPathForContinueToApp = "//*[@text='Continue to the app']";
            By elForContinueToApp = SelectMobileByXpath.createByXpath(xPathForContinueToApp);
            clickElement(elForContinueToApp);
        }

        String xPathForSecurityConfirmations = "//*[@text='Security confirmations']";
        By elForSecurityConfirmations = SelectMobileByXpath.createByXpath(xPathForSecurityConfirmations);
        clickElement(elForSecurityConfirmations);

        String xPathEnterPin = "//*[@text='Enter PIN']";
        By elEnterPin = SelectMobileByXpath.createByXpath(xPathEnterPin);
        Assert.assertTrue(isElementPresent(elEnterPin));

        BaseMobile.driver.getKeyboard().sendKeys("1");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("3");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("7");
        WaitHelpers.waitForSeconds(3);
        BaseMobile.driver.getKeyboard().sendKeys("9");



        String xPathForConfirmButton = "//*[@text='Confirm']";
        By elForConfirmButton = SelectMobileByXpath.createByXpath(xPathForConfirmButton);
        Assert.assertTrue(isElementPresent(elForConfirmButton));

        clickElement(elForConfirmButton);

        BaseMobile.teardown();
    }
}
