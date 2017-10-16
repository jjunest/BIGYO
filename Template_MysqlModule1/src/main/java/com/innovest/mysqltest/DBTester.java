package com.innovest.mysqltest;

import java.sql.Connection;

import javax.activation.DataSource;
import javax.inject.Inject;

import org.junit.Test;

public class DBTester {

	@Inject
	private DataSource ds;

	@Test
	public void testDS() throws Exception {
	}

}
