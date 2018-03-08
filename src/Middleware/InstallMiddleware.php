<?php
namespace AvoRed\Install\Middleware;

use Closure;
use Illuminate\Support\Facades\Storage;

class InstallMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {

        if(!Storage::disk('local')->has('installed.txt')) {
            return redirect()->to('/install');
        }
        //todo check in middleware
        $installFile = Storage::disk('local')->has('installed.txt');
        if('.installed' != $installFile) {
            return redirect()->to('/install');
        }


        return $next($request);
    }
}
