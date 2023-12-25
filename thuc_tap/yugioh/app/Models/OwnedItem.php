<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OwnedItem extends Model
{
    use HasFactory;
    protected $table = 'OwnedItems';
    public $timestamps = false;

    protected $fillable = [
        'ItemID', 'OwnerID', 'NgaySoHuu',
    ];

    // Define relationships
    public function item()
    {
        return $this->belongsTo(Item::class, 'ItemID', 'ItemID');
    }

    // Assume you have a User model for the OwnerID foreign key
    public function owner()
    {
        return $this->belongsTo(User::class, 'OwnerID', 'UserID');
    }
}
