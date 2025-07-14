/*
/// Module: v1
module v1::v1;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


module move_v1::counter {
    use sui::object::{UID, new};
    use sui::tx_context::{TxContext, sender};
    use sui::transfer;

    public struct Counter has key {
        id: UID,
        value: u64,
    }

    public entry fun create(ctx: &mut TxContext) {
        let id = new(ctx);
        let counter = Counter { id, value: 0 };
        transfer::transfer(counter, sender(ctx))
    }

    public entry fun increment(counter: &mut Counter) {
        counter.value = counter.value +1;
    }

    public fun get(counter: &Counter): u64 {
        counter.value
    }

}