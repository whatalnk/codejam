#include <iostream>
#include <algorithm>

using namespace std;

const int X = 1000000000 + 7;
const int MAX_K = 10000 + 1;

int T,
    N;
int K[MAX_K];
int mpow[MAX_K];
long long curr;

int main()
{
  mpow[0] = 1;
  for (int i = 1; i < MAX_K; i++)
  {
    mpow[i] = mpow[i - 1] * 2 % X;
  }
  ios::sync_with_stdio(false);
  cin >> T;
  for (int c = 0; c < T; c++)
  {
    long long ret = 0;
    cin >> N;
    for (int i = 0; i < N; i++)
    {
      cin >> K[i];
    }
    for (int i = 0; i < N; i++)
    {
      for (int j = i + 1; j < N; j++)
      {
        curr = mpow[j - i - 1];
        ret += ((K[j] - K[i]) * curr) % X;
        ret %= X;
      }
    }
    cout << "Case #" << c + 1 << ": " << ret % X << endl;
  }
  return 0;
}
