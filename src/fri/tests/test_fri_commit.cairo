use cairo_verifier::fri::fri::fri_commit;
use cairo_verifier::fri::fri_config::FriConfig;
use cairo_verifier::channel::channel::ChannelTrait;
use cairo_verifier::table_commitment::table_commitment::TableCommitmentConfig;
use cairo_verifier::vector_commitment::vector_commitment::VectorCommitmentConfig;

// test generated based on cairo0-verifier run on fib proof from stone-prover
#[test]
#[available_gas(9999999999)]
fn test_fri_commit() {
    let channel = ChannelTrait::new_with_counter(
        u256 { low: 0xaddb0b52526024a1fd926e5da9d8d0ec, high: 0x4b7afc7a5bab4c0aab0b403f8daf81cf },
        0x1
    );

    let fri_config = FriConfig {
        log_input_size: 0x16,
        n_layers: 0x5,
        inner_layers: array![
            TableCommitmentConfig {
                n_columns: 0x10,
                vector: VectorCommitmentConfig {
                    height: 0x12, n_verifier_friendly_commitment_layers: 0x16,
                },
            },
            TableCommitmentConfig {
                n_columns: 0x8,
                vector: VectorCommitmentConfig {
                    height: 0xf, n_verifier_friendly_commitment_layers: 0x16,
                },
            },
            TableCommitmentConfig {
                n_columns: 0x4,
                vector: VectorCommitmentConfig {
                    height: 0xd, n_verifier_friendly_commitment_layers: 0x16,
                },
            },
            TableCommitmentConfig {
                n_columns: 0x4,
                vector: VectorCommitmentConfig {
                    height: 0xb, n_verifier_friendly_commitment_layers: 0x16,
                },
            }
        ]
            .span(),
        // Array of size n_layers, each entry represents the FRI step size,
        // i.e. the number of FRI-foldings between layer i and i+1.
        fri_step_sizes: array![0x0, 0x4, 0x3, 0x2, 0x2,].span(),
        log_last_layer_degree_bound: 0x7,
    };
}
