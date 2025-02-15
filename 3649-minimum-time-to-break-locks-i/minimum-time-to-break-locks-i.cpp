class Solution {
public:
int n;
    void solve(vector<int> &arr,vector<bool> &used, vector<int> &curr,vector<vector<int>> &res){
        
        if(curr.size()==n){
            res.push_back(curr);
            return;
        }
 

        for(int i=0;i<n;i++){
            if(!used[i]){
                  curr.push_back(arr[i]);
                  used[i]=true;
                  solve(arr,used,curr,res);
                  curr.pop_back();
                  used[i]=false;

            }
        }

        
    }
    int findMinimumTime(vector<int>& strength, int k) {
        n=strength.size();
        int ans=INT_MAX;

        vector<vector<int>> res;
        vector<int> curr;
        vector<bool> used(n,false);

        solve(strength,used,curr,res);

        for(auto &v: res){
            int time=0,x=1,energy=0;
            for(auto &a: v){
                // cout<<x<<" ";
                time+=(a+x-1)/x;
                x+=k;
            }
            ans=min(ans,time);
            // cout<<endl;
        }


        return ans;
    }
};