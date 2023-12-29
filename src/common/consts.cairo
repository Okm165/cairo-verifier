const STARK_PRIME: u256 =
    3618502788666131213697322783095070105623107215331596699973092056135872020481;
const STARK_PRIME_MINUS_TWO: felt252 =
    3618502788666131213697322783095070105623107215331596699973092056135872020479;

const FIELD_GENERATOR: felt252 = 3;
const FIELD_GENERATOR_INVERSE: felt252 =
    1206167596222043737899107594365023368541035738443865566657697352045290673494;

const MONTGOMERY_R: felt252 =
    3618502788666127798953978732740734578953660990361066340291730267701097005025; // 2**256 % STARK_PRIME
const MONTGOMERY_R_INVERSE: felt252 =
    113078212145816603762751633895895194930089271709401121343797004406777446400;

const C_PRIME_AS_UINT256_LOW: u128 = 31;
const C_PRIME_AS_UINT256_HIGH: u128 =
    329648542954659146201578277794459156480; // 31 * 0x8000000000000110000000000000000;