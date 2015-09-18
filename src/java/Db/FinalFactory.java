package Db;

import dao.RssDAO;
import dao.RssDAOImpl;
import dao.UserDAO;
import dao.UserDAOImpl;
import rss.RssHelper;
import rss.RssHelperImpl;

public class FinalFactory {

	private static FinalFactory factory = null;

	private FinalFactory() {
	}

	public static FinalFactory getInstance() {
		if (factory == null)
			return new FinalFactory();
		else
			return factory;
	}

	public static UserDAO getUserDAOInstance() {
		return new UserDAOImpl();
	}

	public static RssHelper getRssHelperInstance() {
		return new RssHelperImpl();
	}

	public static RssDAO getRssDAOInstance() {
		return new RssDAOImpl();
	}

}
