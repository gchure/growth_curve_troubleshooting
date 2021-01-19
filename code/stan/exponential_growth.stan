data { 
    // Dimensional parameters
    int<lower=1> N; // Number of points
    int<lower=1> J; // Number of unique carbon sources 
    int<lower=1, upper=J> idx[N]; // Identification vector which maps measurement to carbon source.
    
    // Measurement parameters
    vector[N] time; // Vector of elapsed time
    vector[N] density; // Vector of optical density.
    }

parameters {
    real<lower=0> sigma; // Homoscedastic error
    vector[J] density_0; // Initial density
    vector[J] lambda; // Growth rate
}

model {
    // Define the physical model
    vector[N] mu = density_0[idx] .* exp(lambda[idx] .* time);
    
    // Prior distributions
    sigma ~ normal(0, 0.1);
    density_0 ~ normal(0, 0.1);
    lambda ~ normal(0, 1);
    
    // Define the likelihood
    density ~ normal(mu, sigma);
    
}