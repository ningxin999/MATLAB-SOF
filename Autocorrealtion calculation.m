clear all;clc
%%import the CPT data
data = importdata('CPT-detrend_data_2.txt');

CPTdata = data(:,2);
%%calculate the autocorrlation coeficients
[ACF,lags] = autocorr(CPTdata);
%%Adopt Exponential fuction to fit the scale of fluctuation
func=inline('exp(-2*abs(lags)./delta)','delta','lags');
delta=lsqcurvefit(func,[5],lags,ACF);
ACF1= func(delta,lags);

%draw the figure together
scatter(0.1.*lags,ACF)
hold on;
plot(0.1.*lags,ACF1);
xlim([0,1.4]);
ylim([-0.2,1.2]);