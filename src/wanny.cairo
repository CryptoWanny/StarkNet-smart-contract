%lang starknet
from starkware.cairo.common.cairo_builtins import HashBuiltin


@storage_var
func my_value_storage() -> (my_value_storage: felt) {
}


@view
func get_my_stored_value{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() -> (
    my_stored_value: felt
) {
    let (my_stored_value) = my_value_storage.read();
    return (my_stored_value,);
}

@external
func set_my_stored_value{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
my_value: felt,
) {
    my_value_storage.write(my_value);
    return ();
}
