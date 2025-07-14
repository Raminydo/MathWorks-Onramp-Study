% MATLAB Onramp: project
% =================================================

% -Stellar Motion

load starData.mat
nObs = size(spectra,1)

lambdaStart = 630.02 % starting wavelength (λstart)

lambdaDelta = 0.14 % spacing

lambdaEnd = lambdaStart+(nObs-1).*lambda_delta % ending wavelength (λstart)

lambda = lambdaStart:lambdaDelta:lambdaEnd % wavelengths in the spectrum

s = spectra(:,6) % default: 6th column is the spectrum of star HD 94028

hold on
plot(lambda,s,".-")
xlabel("Wavelength")
ylabel("Intensity")

[sHa,idx] = min(s) % idx: location of the hydrogen-alpha line (λHa)

lambdaHa = lambda(idx)

plot(lambdaHa,sHa,"rs",MarkerSize=8)

z = (lambdaHa/656.28)-1 % 656.28: wavelength of the hydrogen-alpha line of HD 94028

speed1 = z*299792.458 % 299792.458: speed of light

% Now that the Redshift is found, the script can be modified to repeat the calculation on any star in the spectra matrix by changing the slider in line 7.

% -------------------------------------------------------------

% --Compare Stellar Spectra

[sHa,idx] = min(spectra);
lambdaHa = lambda(idx);
z = (lambdaHa/656.28)-1;
speed = z*299792.458
% a positive speed means that the star is moving away from Earth(redshifted spectrum).
% a negative speed means that the star is moving toward Earth(blueshifted spectrum).

for v=1:7
    s = spectra(:,v)

    if speed(v)<=0
        plot(lambda,s,"--")

    hold on

    else
        if speed(v)>0
            plot(lambda,s,LineWidth=3)
        end

    end

end

hold off

legend(starnames,"location","northeastoutside")

movaway = starnames(speed>0)

% general overview
plot(lambda,spectra)
legend(starnames,"location","northeastoutside")
