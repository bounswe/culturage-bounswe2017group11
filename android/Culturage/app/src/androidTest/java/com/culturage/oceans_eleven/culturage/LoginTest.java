package com.culturage.oceans_eleven.culturage;

import android.support.test.filters.SmallTest;
import android.support.test.runner.AndroidJUnit4;

import com.culturage.oceans_eleven.culturage.signup_login.LoginActivity;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;

@RunWith(AndroidJUnit4.class)
@SmallTest
public class LoginTest {

    public static final String TEST_STRING = "This is a string";
    public static final long TEST_LONG = 12345678L;
    private LoginActivity mLogin;


    @Before
    public void createLogHistory() {
        mLogin = new LoginActivity();
    }

    @Test
    public void testLaunch() {

       /* // Set up the Parcelable object to send and receive.
        mLogin.addEntry(TEST_STRING, TEST_LONG);

        // Write the data.
        Parcel parcel = Parcel.obtain();
        mLogin.writeToParcel(parcel, mLogin.describeContents());

        // After you're done with writing, you need to reset the parcel for reading.
        parcel.setDataPosition(0);

        // Read the data.
        LoginActivity createdFromParcel = LoginActivity.BIND_AUTO_CREATE.createFromParcel(parcel);
        List<Pair<String, Long>> createdFromParcelData = createdFromParcel.getData();

        // Verify that the received data is correct.
        assertThat(createdFromParcelData.size(), is(1));
        assertThat(createdFromParcelData.get(0).first, is(TEST_STRING));
        assertThat(createdFromParcelData.get(0).second, is(TEST_LONG));
        //View view = mActivity.findViewById(R.id.tvMainText);

      //  Assert.assertNotNull(view); */

    }

    @After
    public void tearDown() throws Exception {

    }
}
