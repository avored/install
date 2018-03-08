<?php
/**
 * AvoRed E commerce built for Laravel Shopping Cart Solution
 *
 * @author    Purvesh <ind.purvesh@gmail.com>
 * @copyright 2017-2018 AvoRed
 * @license   https://opensource.org/licenses/MIT MIT
 * @link      https://www.avored.com
 */


namespace AvoRed\Install\Requests;

use Illuminate\Foundation\Http\FormRequest as Request;

class AdminUserRequest extends Request
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'first_name' => 'required|max:255',
            'last_name' => 'required|max:255',
            'email' => 'required|email|max:255|unique:admin_users',
            'password' => 'required|min:6|confirmed',
        ];
    }
}
