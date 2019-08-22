# Fuzzy C-means

Fuzzy c-means clustering algorithm implementation using Matlab.

X is the dataset  
K is the number of clusters  
m is the fuzzyfication parameter (currently "2" in order to improve performance)  
N_MAX is the maximum number of iterations  
threshold is the value used in order to check the convergence ("0.01" in my case)  
V is the centroids' matrix.  

______________________________________________________________________________________________

Tip:  
I used the following lines of code to determine which cluster each single datapoint belongs to.  

'''
fcm_labels = ones(size(X,1),1);  
for i = 1:size(X,1)  
    aux = fcm_U(i,:);  
    [elem,index] = max(aux);  
    fcm_labels(i,1) = index;   
end 
'''

