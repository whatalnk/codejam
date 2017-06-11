// Wrong answer, segfault

#include <iostream>
#include <algorithm>

using namespace std;

const int R_MAX = 3000;
const int C_MAX = 3000;

int T;
int r, c, k;
int ri, ci;
int m[R_MAX][C_MAX];

int main()
{
  ios::sync_with_stdio(false);
  cin >> T;
  for (int cc = 0; cc < T; cc++)
  {
    cin >> r >> c >> k;

    for (int i = 0; i < r; i++){
      for (int j = 0; j < c; j++){
        m[i][j] = 0;
      }
    }

    int cumsum[r+1][c+1];
    
    for (int i = 0; i < k; i++){
      cin >> ri >> ci;
      m[ri][ci] = 1;
    }
    
    for (int i = 0; i < r; i++){
      for (int j = 0; j < c; j++){
      cumsum[i+1][j+1] = m[i][j] + cumsum[i][j+1] + cumsum[i+1][j] - cumsum[i][j];
      }
    }
    int ret = 0;
    int shorter = min(r, c);
    for (int i = 0; i < shorter; i++){
      // cout << i << endl;
      if (i == 0){
        ret += (r * c - k);
      } else {
        for (int row = i+1; row <= r; row++) {
          for (int col = i+1; col <= c; col++) {
            int n_monster = cumsum[row][col] - cumsum[row-(i+1)][col] - cumsum[row][col-(i+1)] + cumsum[row-(i+1)][col-(i+1)];
            // cout << "[" << row << " " << col << " " << n_monster << " " << "]" << endl;
            if (n_monster == 0){
              ret += 1;
            }
          }
        }
      }
    }
    cout << "Case #" << cc + 1 << ": " << ret << endl;
  }
  return 0;
}
