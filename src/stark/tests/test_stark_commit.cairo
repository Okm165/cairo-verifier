use cairo_verifier::{
    stark::stark_commit::stark_commit, channel::channel::ChannelTrait,
    tests::{stone_proof_fibonacci, stone_proof_fibonacci_keccak}
};

// === BLAKE ONLY BEGIN ===
// #[test]
// #[available_gas(9999999999)]
// fn test_stark_commit() {
//     let mut channel = ChannelTrait::new_with_counter(
//         u256 { low: 0xba9d17a3ebd900899148b125421c118f, high: 0x87433b8dd90acbfe5abea8474d795191 },
//         0x0
//     );
// 
//     let public_input = stone_proof_fibonacci::public_input::get();
//     let unsent_commitment = stone_proof_fibonacci::stark::unsent_commitment::get();
//     let config = stone_proof_fibonacci::stark::config::get();
//     let stark_domains = stone_proof_fibonacci::stark::domains::get();
// 
//     assert(
//         stark_commit(
//             ref channel, @public_input, @unsent_commitment, @config, @stark_domains
//         ) == stone_proof_fibonacci::stark::commitment::get(),
//         'Invalid value'
//     );
// 
//     assert(
//         channel
//             .digest == u256 {
//                 low: 0x2c31f04a6b9c83c2464b2f1688fc719e, high: 0xe631d91ef56f7e4cc7fe09cff2cc4e94
//             },
//         'Invalid value'
//     );
//     assert(channel.counter == 0, 'Invalid value');
// }
// === BLAKE ONLY END ===

// === KECCAK ONLY BEGIN ===
#[test]
#[available_gas(9999999999)]
fn test_stark_commit() {
    let mut channel = ChannelTrait::new_with_counter(
        u256 { low: 0x22b3f4d7841a28271009bef644a84a5e, high: 0x8f17c0c0dcde2144cd36213ab3aaff1b },
        0x0
    );

    let public_input = stone_proof_fibonacci_keccak::public_input::get();
    let unsent_commitment = stone_proof_fibonacci_keccak::stark::unsent_commitment::get();
    let config = stone_proof_fibonacci_keccak::stark::config::get();
    let stark_domains = stone_proof_fibonacci_keccak::stark::domains::get();

    assert(
        stark_commit(
            ref channel, @public_input, @unsent_commitment, @config, @stark_domains
        ) == stone_proof_fibonacci_keccak::stark::commitment::get(),
        'Invalid value'
    );

    assert(
        channel
            .digest == u256 {
                low: 0x210c99e614db21dcd882b7f3734a477b, high: 0x29786ad320869955ebf8c196e16009e1
            },
        'Invalid value'
    );
    assert(channel.counter == 0, 'Invalid value');
}
// === KECCAK ONLY END ===


