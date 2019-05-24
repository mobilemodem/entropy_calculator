function [H] = sample_entropy(x, num_bin)
%sample_entropy This function, calculates sample entropy of given
              % Data x with specifid number of bins
[counts,bins] = hist(x,num_bin);
diffrence = diff(bins);
diffrence = [diffrence(end),diffrence]; % Replicate last bin width for first, which is indeterminate.
nz = counts>0; % Index to non-zero bins
probability = counts(nz)/sum(counts(nz));
H = -sum(probability.*log(probability./diffrence(nz)));
end

