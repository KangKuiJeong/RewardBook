package payment.controller;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException; 
import org.quartz.Trigger; 
import org.quartz.impl.StdSchedulerFactory;
import static org.quartz.JobBuilder.newJob; 
import static org.quartz.TriggerBuilder.newTrigger; 
import static org.quartz.CronScheduleBuilder.*; 
public class Payment_Scheduler implements ServletContextListener { 
	
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		System.out.println("톰캣 종료");
		try {
			Scheduler scheduler = StdSchedulerFactory.getDefaultScheduler();
			
			scheduler.shutdown(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		System.out.println("톰캣 구동");
		
		try { // Grab the Scheduler instance from the Factory 
			Scheduler scheduler = StdSchedulerFactory.getDefaultScheduler(); 
			// and start it off 
			scheduler.start(); 
			// define the job and tie it to our HelloJob class 
			JobDetail job = newJob(Payment_RealPay.class) .withIdentity("Payment_RealPay", "group1") .build();
			// Trigger the job to run now, ss mm hh dd MM Week 
			Trigger trigger = newTrigger() .withIdentity("trigger1", "group1") .withSchedule(cronSchedule("1 * * * * ?")) .build(); 
			// Tell quartz to schedule the job using out trigger 
			scheduler.scheduleJob(job, trigger); 
			
			} catch (SchedulerException se) { 
				se.printStackTrace(); 
			} 
		
	}
	
}


