#include <stdio.h>
#include <omp.h>
#include <time.h>


int sum_of_squares_parallel(int start, int stop, int step, int threads) {
    int ans = 0; // Объявляем переменную ans вне параллельной секции
    #pragma omp parallel num_threads(threads) shared(start, stop, step) reduction(+:ans) default(none)
    #pragma omp for
        for (int i = start; i < stop; i += step)
            ans += i * i / (i - 1);
    return ans;
}


int main()
{
    double t0 = omp_get_wtime();

    int start = 0, stop = 1e9, step = 1;
    int n = 100, ans;

    for (int i = 0; i < n; i++)
        ans = sum_of_squares_parallel(start, stop, step, omp_get_max_threads());
//    printf("ans = %d\n", ans);
    printf("time = %f;\n", omp_get_wtime() - t0);
    return 0;
}
