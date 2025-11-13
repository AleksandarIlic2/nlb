package si.nlb.testautomation.NLBTestAutomation.Core;

import io.appium.java_client.AppiumDriver;
import io.appium.java_client.android.Activity;
import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.android.StartsActivity;
import io.appium.java_client.ios.IOSDriver;
import io.appium.java_client.ios.IOSElement;
import io.appium.java_client.remote.MobileCapabilityType;
import io.appium.java_client.service.local.AppiumDriverLocalService;
import io.appium.java_client.service.local.AppiumServiceBuilder;
import io.appium.java_client.service.local.flags.GeneralServerFlag;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.support.ui.WebDriverWait;
import si.nlb.testautomation.NLBTestAutomation.Data.DataManager;
import si.nlb.testautomation.NLBTestAutomation.Data.ExcelFactory;
import si.nlb.testautomation.NLBTestAutomation.Helpers.Log;
import si.nlb.testautomation.NLBTestAutomation.Test.Hooks;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.ServerSocket;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;


public class BaseMobile {

    public static URL url;
    public static int passed = 0;
    public static String testPlatform = "Android";
    public static String testVer = "";
    public static ArrayList<HashMap<String, String>> datamap;
    public static ArrayList<HashMap<String,String>> confdata;
    public static ArrayList<HashMap<String,String>> conf_env_data;
    public static AppiumDriver driver = null;
    public static WebDriverWait waitVar = null;
    public static String getErrorMessage = "";
    public static int DEFAULT_IMPLICIT_WAIT =30;
    public static String env;
    public static String deviceUdid = "emulator-5554";
    public static String deviceDeviceName = "device";
    public static String devicePlatformName = "Android";
    public static String devicePlatformVersion = "11";
    public static String deviceAVD = "PixelXL";
    public static String deviceAPP = "C:\\Applications\\Apk\\app-slovenia-uat-release_3.3.89_20220901.apk";
    public static String devicePIN = "1379";;

    public static String getDataFromFileConf(String arg1, String columnName) {
        confdata = ExcelFactory.getDataFromExcel("testdata/configuration.xlsx", "Sheet1");
        int index = Integer.parseInt(arg1) - 1;
        return confdata.get(index).get(columnName);
    }

    public static String getDataFromConfEnvironment(String arg1, String columnName){
        conf_env_data = ExcelFactory.getDataFromExcel("testdata/configuration.xlsx", "Sheet1");
        int index = Integer.parseInt(arg1) - 1;
        return conf_env_data.get(index).get(columnName);
    }

  public static void createDriver() throws IOException, InterruptedException {

        /*if(getDataFromFileConf(Hooks.rowinConfExcel, "PLATFORM_NAME").equals("iOS")){
          System.out.println("iOS driver");
          testPlatform = "iOS";
          testVer =getDataFromFileConf(Hooks.rowinConfExcel, "PLATFORM_VERSION");
          final String URL_STRING = "http://127.0.0.1:4723/wd/hub";
          url = new URL(URL_STRING);
          final DesiredCapabilities capabilities = new DesiredCapabilities();
          capabilities.setCapability(MobileCapabilityType.DEVICE_NAME, getDataFromFileConf(Hooks.rowinConfExcel, "DEVICE_NAME"));
          capabilities.setCapability(MobileCapabilityType.PLATFORM_NAME, getDataFromFileConf(Hooks.rowinConfExcel, "PLATFORM_NAME"));
          capabilities.setCapability(MobileCapabilityType.PLATFORM_VERSION, testVer);
          capabilities.setCapability(MobileCapabilityType.UDID, getDataFromFileConf(Hooks.rowinConfExcel, "UDID"));
          capabilities.setCapability(MobileCapabilityType.APP, getDataFromFileConf(Hooks.rowinConfExcel, "APP"));
          capabilities.setCapability(MobileCapabilityType.NO_RESET, true);
          capabilities.setCapability("appium:shouldTerminateApp", true);
          capabilities.setCapability("appium:newCommandTimeout", 180);
          //capabilities.setCapability(MobileCapabilityType.FULL_RESET, true);
          capabilities.setCapability("bundleId", getDataFromFileConf(Hooks.rowinConfExcel, "BUNDLE_ID"));
          capabilities.setCapability(MobileCapabilityType.AUTOMATION_NAME, getDataFromFileConf(Hooks.rowinConfExcel, "AUTOMATION_NAME"));
          capabilities.setCapability("useNewWDA", true);
          capabilities.setCapability("locationServicesEnabled", true);
          capabilities.setCapability("locationServicesAuthorized", true);


          driver = new IOSDriver<IOSElement>(url, capabilities);
          driver.manage().timeouts().implicitlyWait(2, TimeUnit.SECONDS);
          waitVar = new WebDriverWait(driver, 60);
      }

         */
      //if (getDataFromFileConf(Hooks.rowinConfExcel, "PLATFORM_NAME").equals("Android")) {
          System.out.println("Android driver");
          testPlatform = "Android";
          DesiredCapabilities capabilities = new DesiredCapabilities();
          //String pkg = getDataFromFileConf(DataManager.getDataFromConfiguration("1", "mobDevicePackage"), "appPackage");
          //String act = getDataFromFileConf(DataManager.mobDeviceActivity, "appActivity");
          String pkg = DataManager.getDataFromConfiguration("1", "mobDevicePackage");
          String act = DataManager.getDataFromConfiguration("1", "appActivity");

          //if value is 1, we are using virtual android device and if not we are using physical device
          if(DataManager.isDeviceVirtual.equals("1")){
              //This is old way of starting app used while appium 1.x was installed
              /*capabilities.setCapability("udid", DataManager.mobDeviceUdid);//getDataFromFileConf(Hooks.rowinConfExcel, "UDID")); //Give Device ID of your mobile phone
              capabilities.setCapability("platformName", DataManager.mobDevicePlatformName);//, getDataFromFileConf(Hooks.rowinConfExcel, "PLATFORM_NAME"));
              capabilities.setCapability("deviceName", DataManager.mobDeviceDeviceName);//, getDataFromFileConf(Hooks.rowinConfExcel, "DEVICE_NAME"));
              capabilities.setCapability("platformVersion", DataManager.mobDevicePlatformVersion);//, getDataFromFileConf(Hooks.rowinConfExcel, "PLATFORM_VERSION"));
              capabilities.setCapability("avd", DataManager.mobDeviceAVD);//, getDataFromFileConf(Hooks.rowinConfExcel, "AVD"));
              //capabilities.setCapability("appPackage", getDataFromFile(rowinConfExcel, "appPackage"));
              capabilities.setCapability("appPackage",DataManager.getDataFromConfiguration("1", "mobDevicePackage"));
              capabilities.setCapability("appActivity",DataManager.mobDeviceActivity);
              capabilities.setCapability("automationName","UiAutomator2");
              //capabilities.setCapability("appActivity", getDataFromFile(rowinConfExcel, "appActivity"));
              //capabilities.setCapability("app", DataManager.mobDeviceAPP);//, getDataFromFileConf(Hooks.rowinConfExcel, "APP"));*/

              //This is new way of starting app used while appium 2.x is installed
              // W3C / Appium 3: prefiks "appium:" za vendor-capabilities
              capabilities.setCapability("platformName", DataManager.getDataFromConfiguration("1","mobDevicePlatformName"));
              capabilities.setCapability("appium:deviceName", DataManager.getDataFromConfiguration("1","mobDeviceDeviceName"));
              capabilities.setCapability("appium:udid", DataManager.getDataFromConfiguration("1","mobDeviceUdid"));
              capabilities.setCapability("appium:platformVersion", DataManager.getDataFromConfiguration("1","mobDevicePlatformVersion"));
              capabilities.setCapability("appium:avd", DataManager.getDataFromConfiguration("1","mobDeviceAVD"));
              capabilities.setCapability("appium:automationName", "uiautomator2");
          }
          else {
              capabilities.setCapability("udid", DataManager.mobDeviceUdidPhysical);//getDataFromFileConf(Hooks.rowinConfExcel, "UDID")); //Give Device ID of your mobile phone
              capabilities.setCapability("platformName", DataManager.mobDevicePlatformName);//, getDataFromFileConf(Hooks.rowinConfExcel, "PLATFORM_NAME"));
              capabilities.setCapability("deviceName", DataManager.mobDeviceDeviceNamePhysical);//, getDataFromFileConf(Hooks.rowinConfExcel, "DEVICE_NAME"));
              capabilities.setCapability("platformVersion", DataManager.mobDevicePlatformVersionPhysical);//, getDataFromFileConf(Hooks.rowinConfExcel, "PLATFORM_VERSION"));
              //capabilities.setCapability("appPackage", getDataFromFile(rowinConfExcel, "appPackage"));
              capabilities.setCapability("appPackage",DataManager.getDataFromConfiguration("1", "mobDevicePackage"));
              capabilities.setCapability("appActivity",DataManager.mobDeviceActivity);
              capabilities.setCapability("automationName","UiAutomator2");
              //capabilities.setCapability("appActivity", getDataFromFile(rowinConfExcel, "appActivity"));
              //capabilities.setCapability("app", DataManager.mobDeviceAPP);//, getDataFromFileConf(Hooks.rowinConfExcel, "APP"));
          }
          // ne dozvoli da Appium auto-startuje app; mi kontrolisemo start/stop
          capabilities.setCapability("appium:autoLaunch", false);
          // ne brisemo podatke (ako zelis “clean slate” vidi donju varijantu)
          capabilities.setCapability("appium:noReset", true);
          // produzava W3C timeout za “idle” komande
          capabilities.setCapability("appium:newCommandTimeout", 100_000);
          // (opciono) gasi AUT pri quit()
          capabilities.setCapability("appium:shouldTerminateApp", true);

          checkIsPhoneLock();
          driver = new AndroidDriver(new URL("http://127.0.0.1:4723/wd/hub"), capabilities);
          waitVar = new WebDriverWait(driver, 60);

          // -- Forsiraj hladan start bez brisanja podataka --
          Map<String, Object> term = new HashMap<>();
          term.put("appId", pkg);
          driver.executeScript("mobile: terminateApp", term);

          // Opcija B: (često “čistije” na Androidu) direktno startuj glavnu Activity
          ((StartsActivity) driver).startActivity(new Activity(pkg, act));
      //}
  }

    public static void checkIsPhoneLock() throws IOException, InterruptedException {
        if (devicePlatformName.equals("Android")) {
            Runtime rt = Runtime.getRuntime();
            //String command = "adb -s " + Base.getDataFromFileConf(Hooks.rowinConfExcel, "UDID") + " shell dumpsys power";
            String command = "adb -s " + DataManager.mobDeviceUdid + " shell dumpsys power";
            Log.info(command);
            Process proc = rt.exec(command);
            BufferedReader stdInput = new BufferedReader(new
                    InputStreamReader(proc.getInputStream()));
            BufferedReader stdError = new BufferedReader(new
                    InputStreamReader(proc.getErrorStream()));
            String s = null;
            String result = "";
            while ((s = stdInput.readLine()) != null) {
                // System.out.println(s);
                if (s.contains("mWakefulness=")) {
                    result = s.trim().substring("mWakefulness=".length()).trim();
                }
            }
            while ((s = stdError.readLine()) != null) {
                Log.info(s);
            }
            if (result.equals("Asleep")) {
                Log.info("Unlocking...");
                Runtime.getRuntime().exec("adb -s " + DataManager.mobDeviceUdid + " shell input keyevent 82");
                Thread.sleep(1000);
                Runtime.getRuntime().exec("adb -s " + DataManager.mobDeviceUdid + " shell input keyevent 82");
                Thread.sleep(1000);
                Runtime.getRuntime().exec("adb -s " + DataManager.mobDeviceUdid + " shell input text " + DataManager.mobDevicePIN);
                Thread.sleep(1000);
                Runtime.getRuntime().exec("adb -s " + DataManager.mobDeviceUdid + " shell input keyevent 66");
                Thread.sleep(2000);
            }
        }
    }

    public static class AppiumServerJava {

        private AppiumDriverLocalService service;
        private AppiumServiceBuilder builder;
        private DesiredCapabilities cap;

        public void startServer() {
            //Set Capabilities
            cap = new DesiredCapabilities();
            cap.setCapability("noReset", "false");
            //Build the Appium service
            builder = new AppiumServiceBuilder();
            builder.withIPAddress("127.0.0.1");
            builder.usingPort(4723);
            builder.withCapabilities(cap);
            builder.withArgument(GeneralServerFlag.SESSION_OVERRIDE);
            builder.withArgument(GeneralServerFlag.LOG_LEVEL, "info");
            String appium_info = "OFF";//getDataFromFileConf("1", "APPIUM_INFO");
            if (appium_info.equals("ON")) {
                builder.withLogFile(new File("./logs/appium.log"));
            }
            //full path to the main.js
            builder.withAppiumJS(new File(getDataFromConfEnvironment("1", "MAIN_JS")));
            //Start the server with the builder
            service = AppiumDriverLocalService.buildService(builder);
            service.start();

        }

        public void stopServer() {
            service.stop();
        }

        public boolean checkIfServerIsRunnning(int port) {

            boolean isServerRunning = false;
            ServerSocket serverSocket;
            try {
                serverSocket = new ServerSocket(port);
                serverSocket.close();
            } catch (IOException e) {
                //If control comes here, then it means that the port is in use
                isServerRunning = true;
            } finally {
                serverSocket = null;
            }
            return isServerRunning;
        }
    }

    public static void teardown() {
        //close the app
        driver.quit();
    }
    public static void closeApp() {
        driver.closeApp();
    }

    public static void launchApp() {
        driver.launchApp();
    }

    public static void resetApp() {
        driver.resetApp();
    }
    public static void back() {
        driver.navigate().back();
    }


}
