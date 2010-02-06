/**
 * Copyright (c) 2000-2010 Liferay, Inc. All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

package com.liferay.portalweb.portlet.assetpublisher.webcontent;

import com.liferay.portalweb.portal.BaseTests;
import com.liferay.portalweb.portlet.assetpublisher.webcontent.addwebcontent.AddWebContentTests;
import com.liferay.portalweb.portlet.assetpublisher.webcontent.ratewebcontent.RateWebContentTests;
import com.liferay.portalweb.portlet.assetpublisher.webcontent.removewebcontent.RemoveWebContentTests;
import com.liferay.portalweb.portlet.assetpublisher.webcontent.selectwebcontent.SelectWebContentTests;
import com.liferay.portalweb.portlet.assetpublisher.webcontent.viewcountwebcontent.ViewCountWebContentTests;
import com.liferay.portalweb.portlet.assetpublisher.webcontent.viewwebcontentabstracts.ViewWebContentAbstractsTests;
import com.liferay.portalweb.portlet.assetpublisher.webcontent.viewwebcontentdynamicassettypewebcontent.ViewWebContentDynamicAssetTypeWebContentTests;
import com.liferay.portalweb.portlet.assetpublisher.webcontent.viewwebcontentfullcontent.ViewWebContentFullContentTests;
import com.liferay.portalweb.portlet.assetpublisher.webcontent.viewwebcontenttable.ViewWebContentTableTests;
import com.liferay.portalweb.portlet.assetpublisher.webcontent.viewwebcontenttitlelist.ViewWebContentTitleListTests;

import junit.framework.Test;
import junit.framework.TestSuite;

/**
 * <a href="WebContentTests.java.html"><b><i>View Source</i></b></a>
 *
 * @author Brian Wing Shun Chan
 */
public class WebContentTests extends BaseTests {

	public static Test suite() {
		TestSuite testSuite = new TestSuite();

		testSuite.addTest(AddWebContentTests.suite());
		testSuite.addTest(RateWebContentTests.suite());
		testSuite.addTest(RemoveWebContentTests.suite());
		testSuite.addTest(SelectWebContentTests.suite());
		testSuite.addTest(ViewCountWebContentTests.suite());
		testSuite.addTest(ViewWebContentAbstractsTests.suite());
		testSuite.addTest(
			ViewWebContentDynamicAssetTypeWebContentTests.suite());
		testSuite.addTest(ViewWebContentFullContentTests.suite());
		testSuite.addTest(ViewWebContentTableTests.suite());
		testSuite.addTest(ViewWebContentTitleListTests.suite());

		return testSuite;
	}

}