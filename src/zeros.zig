// List of root hashes of zero-subtries, up to depth 255.
const std = @import("std");

const strs = [_][]const u8{
    "f5a5fd42d16a20302798ef6ed309979b43003d2320d9f0e8ea9831a92759fb4b",
    "db56114e00fdd4c1f85c892bf35ac9a89289aaecb1ebd0a96cde606a748b5d71",
    "c78009fdf07fc56a11f122370658a353aaa542ed63e44c4bc15ff4cd105ab33c",
    "536d98837f2dd165a55d5eeae91485954472d56f246df256bf3cae19352a123c",
    "9efde052aa15429fae05bad4d0b1d7c64da64d03d7a1854a588c2cb8430c0d30",
    "d88ddfeed400a8755596b21942c1497e114c302e6118290f91e6772976041fa1",
    "87eb0ddba57e35f6d286673802a4af5975e22506c7cf4c64bb6be5ee11527f2c",
    "26846476fd5fc54a5d43385167c95144f2643f533cc85bb9d16b782f8d7db193",
    "506d86582d252405b840018792cad2bf1259f1ef5aa5f887e13cb2f0094f51e1",
    "ffff0ad7e659772f9534c195c815efc4014ef1e1daed4404c06385d11192e92b",
    "6cf04127db05441cd833107a52be852868890e4317e6a02ab47683aa75964220",
    "b7d05f875f140027ef5118a2247bbb84ce8f2f0f1123623085daf7960c329f5f",
    "df6af5f5bbdb6be9ef8aa618e4bf8073960867171e29676f8b284dea6a08a85e",
    "b58d900f5e182e3c50ef74969ea16c7726c549757cc23523c369587da7293784",
    "d49a7502ffcfb0340b1d7885688500ca308161a7f96b62df9d083b71fcc8f2bb",
    "8fe6b1689256c0d385f42f5bbe2027a22c1996e110ba97c171d3e5948de92beb",
    "8d0d63c39ebade8509e0ae3c9c3876fb5fa112be18f905ecacfecb92057603ab",
    "95eec8b2e541cad4e91de38385f2e046619f54496c2382cb6cacd5b98c26f5a4",
    "f893e908917775b62bff23294dbbe3a1cd8e6cc1c35b4801887b646a6f81f17f",
    "cddba7b592e3133393c16194fac7431abf2f5485ed711db282183c819e08ebaa",
    "8a8d7fe3af8caa085a7639a832001457dfb9128a8061142ad0335629ff23ff9c",
    "feb3c337d7a51a6fbf00b9e34c52e1c9195c969bd4e7a0bfd51d5c5bed9c1167",
    "e71f0aa83cc32edfbefa9f4d3e0174ca85182eec9f3a09f6a6c0df6377a510d7",
    "31206fa80a50bb6abe29085058f16212212a60eec8f049fecb92d8c8e0a84bc0",
    "21352bfecbeddde993839f614c3dac0a3ee37543f9b412b16199dc158e23b544",
    "619e312724bb6d7c3153ed9de791d764a366b389af13c58bf8a8d90481a46765",
    "7cdd2986268250628d0c10e385c58c6191e6fbe05191bcc04f133f2cea72c1c4",
    "848930bd7ba8cac54661072113fb278869e07bb8587f91392933374d017bcbe1",
    "8869ff2c22b28cc10510d9853292803328be4fb0e80495e8bb8d271f5b889636",
    "b5fe28e79f1b850f8658246ce9b6a1e7b49fc06db7143e8fe0b4f2b0c5523a5c",
    "985e929f70af28d0bdd1a90a808f977f597c7c778c489e98d3bd8910d31ac0f7",
    "c6f67e02e6e4e1bdefb994c6098953f34636ba2b6ca20a4721d2b26a886722ff",
    "1c9a7e5ff1cf48b4ad1582d3f4e4a1004f3b20d8c5a2b71387a4254ad933ebc5",
    "2f075ae229646b6f6aed19a5e372cf295081401eb893ff599b3f9acc0c0d3e7d",
    "328921deb59612076801e8cd61592107b5c67c79b846595cc6320c395b46362c",
    "bfb909fdb236ad2411b4e4883810a074b840464689986c3f8a8091827e17c327",
    "55d8fb3687ba3ba49f342c77f5a1f89bec83d811446e1a467139213d640b6a74",
    "f7210d4f8e7e1039790e7bf4efa207555a10a6db1dd4b95da313aaa88b88fe76",
    "ad21b516cbc645ffe34ab5de1c8aef8cd4e7f8d2b51e8e1456adc7563cda206f",
    "6bfe8d2bcc4237b74a5047058ef455339ecd7360cb63bfbb8ee5448e6430ba04",
    "a7f23ce9181740dc220c814782654fee6aceb9f1ec9222c4e2467d0ab1680837",
    "aef9476c89590a2c8cc9b3b74f4967c757c49d9866a44bacf21fa2ed675ddfa2",
    "9a42bcad82f6a9e41284d808ead319f29f3b08209d680f0e2ce71510d071e205",
    "d1a66d354a67b9cf179571d8e5f97792716e8dd4ec44196839a3f7c6b74f8bac",
    "fafa3025f2f89509c2c71c74fba0cd92858ef49b0780fb5479746c8a9bfcb346",
    "3334a7c1e7f6705aa6011a6a949645016db4acde0ca9abd66dc79d8266423056",
    "0796fd75664faef744ee4e52d7271e2bbb769f91ed6f9b74d8b694f56606852c",
    "7ba3ae4a417fe8545b142bc89f4adcd7ae13941cbab7750b83e9f0a66d16be64",
    "788fafcc4aa520399adbaed195f8b12c4eb31ec10168e50aabc659a6aea516dc",
    "e833d7a67160e68bf4c9044a53077df2727ad00cf36f4949c7b681a912140cbb",
    "309eabf095dc6714f9f4d864bba5affae0b35ae2f5e3565bcc3a47b212767701",
    "226a8ebefa288665a644a50273335efbb610510f241b5b720c8a368d59a69a5d",
    "41abfd995425827625938131af0c4f33fe0bd4688c222c21fa9da8e89caa03f8",
    "442c642ef50fa1a667a6e6d105c77c5cc3fec8d7aa2570cf1a3077b503c38069",
    "a0a08dfc9b42d96c2de19b6d127b8ae136ddcf3e5ad0dce422c45a56f61f6a74",
    "7d348382af096dbe0bf086c7bb39b2a2c0bc36b621ab0c738e9885d731d81740",
    "3ab134751d191269026c86994eaa8b43a83b4ad1f6d0e77381c4e2974afbc8f6",
    "9a7452611db2d23eae26f9bdbb88958ef44c64d0fe987be9f726adf938f50f6c",
    "725c7f816037bfe452cd1e7ba35ac47edcb49a9a2b27aeca70dce483cb7ded1f",
    "2cea1af51fb28b62887c39998ac9fef4dfdeda1f07e071ba558a173afd06cbc3",
    "ff1d59f98b6c551d95089357057d5c8be26402279e9df0b1df1a10b72bf3927f",
    "2f8a181f7c99dd215a7529bfe296a9603a1446737186d21aeb8bc7ae59e1fd21",
    "ecc502c9b1145f3950cb7d3e3842446f81a4f0df1df537cee139ef64ea984bd9",
    "c885c236140249c9e1640e5e99fb972d81fbb31ea5e29fbdde063627f0d6bdc8",
    "303ce38809ba7a77b660ad0b074af9c6bcd5c02bbff2f3b0248633b0b876e449",
    "2fd4c32b0a65616d4bceb9e2f2bd4dcf7535546f433a3e1d45ce54abc059c867",
    "2f8d300488ab4f7464d9ee9e59d80aaa8a2039af5513f320e5a3083c63ea68ef",
    "48562f2ab1873a6120f575267a37db470d4a6bc83ed1ad903e64f7b3755766ad",
    "2820f9073707ceff6a0e5e2bcfca8d73d235ade70d0afd535c9177fb9266c9f7",
    "f3f6a8151f64f6bdddc4b8c0963c5712eef47d6eb432f12699c5295914f08ea2",
    "2ea941b101d99e7b6b18a6a62a0f573c4b80d0c68ca1d15f885de9ce0b4fc488",
    "8212c49b0949693091c6672a06241f3df865a676cccdcbd16f0615eea6068383",
    "e726e40dbd2f9841293b5b3c15e918a872aed2ba491f4e111ea0913a04ffe165",
    "7729475e1ace968d096a7cbf0b88348158a37eef64b90994cbd37ddc3adf5370",
    "fc487e466c2bf48d87b5d66f5aa24f9c5b3f990e210f5065050d5208d59b6b87",
    "77fc88582c114fb77e9bc6666e3f3fc6e89e4cbd3dd1590a6f67adb547f348d5",
    "dc243614ffda79e3d7556ef3fdea0b44df1757badae017b05f5133fd15c27aea",
    "e705095fe3ed6cb2da458664229c5158d88aa0f775528dfb27ff3ffe270fc0c9",
    "779f1ecbfae3d0e1e7328817446dbf4bcb6a678c6ca4e2726e9f3e6e65fcdaca",
    "5e5c577e401fb0ed3c051979201cfc5ec100dae9942278e99e3434cfe560c276",
    "1894ce6124659cb0d6f90a84424e372b59dd7e7220bdb16804539b51ba7c6ef1",
    "641edf1965e87a70428712727ed1db13b2de91ed574c83b28339bc7502aec3f2",
    "0a36dc4d1b170aec654cd6e3886f6ae3a2448d30a95e3ae5c56b7a5b00cb8f3d",
    "571968a6a58857784b13e1bf9480285a7ae70ddf2e321d06b17cf0a933119cdd",
    "e56813628ec57e8de059bca787d1ef7cb1cb9f608c6ba0bf780277beddbd3f27",
    "5ef1e53a05f43d01472447d914409459ce5f2b0d24566187efdbefc25864da2b",
    "ad19b79824b2a80a8b891450d2c7fccf9e51c25979b37dba8ed597fb93ba9d9d",
    "180fedca06656cb910077013ad2679695090269fad1589e290162fe90e97d4aa",
    "73f472650e8da09bcf2c8cb998db52bb27bba5c6335d4844323d68094c1028f8",
    "ff746696955cfa91aed5e76102710dfe2e278279bf543de9c3df8a7134a33b64",
    "2e98ae4b6e69b95b71048ec119719851c050529a20c67a2c401723b34de9748a",
    "3b5c39d7274c2a74d4ed2d9e8410ead2f351dfd6158148f1b10d97d60d739207",
    "423f672311c1a44ce5a44765f6217eabf759de2bd882b6bf0f7b09694e4b8043",
    "a3ba0d85049395335718883c7451cd3d10a326b1d73e223aa5549ee68c3beabf",
    "d3d47dffaa99a033c8c3bb62dc0a438b71f91b18a38c87a49fa88474dde87924",
    "4189d201eed3f4ebcb3fd5a4c73f282923f010e753c3c5e7e3d0199037a3b087",
    "142a03b09d66cbe5b45fea8fa25d6a297084aed9e03bee72862f9d6b3dbabba0",
    "4cd8ea52aca52408fb87b0e697cd24632d94a6df757fa3f29cc0a5d5494edcc5",
    "afa2c75dc2c5a8462c17092ee1efe21de9b10f0dc0dea0794f304513e1aa33d2",
    "3d39740655edfc46fb8afd539e23070dfb35e0d6d1cf67eed7a1c25442e01696",
    "7d609e3eee6fa33910f427d52e88efcca673e453b4acde37a8a8687f3d3af57a",
    "7811af413c13feec4a8c2774f189a7e24069b688700756b947de0157185432c6",
    "571c032857aadbec07310299b0041c26924a619669e161559a5b1f49aff9cc09",
    "0a6b5e75c36a716b43d41d262adb047d165da4c39a512f145f5fc90f86923ea3",
    "547374ec1a58c7a4d14d51afb52ed4e404a9eb22f008b3387d326edbd3066c77",
    "f9e4305daad80dfb3776230d54edddf5050cefe0846999414c706ea60aa3fe11",
    "560094093e5d3692d4918b79804f7eb6a0a1868000aac0659090d995c2377045",
    "95cba54239a7304d36b0530219dfb8446e85ddc9bb6d401f6324fd888bdae4f7",
    "ef97d5ba70031de19734533a11bc7a52ca5b05c3b1d2c61d53010a57878dae8d",
    "854accef35670517593e126a933f9a77ffb7b6ced2735f5518f5dc16b16ec0cd",
    "7f11203031a72517235fc9bcf05675a6f67062c3e2db8ec26f6841bc04125818",
    "313a6522e9eaae01ff1e4bb545c042d2ce3a7271f668ecaa303b54eb70ebf294",
    "bcfd4c9b524c615b741dd6f5d4aea9779e53eae70e56b884d238c96859f4b745",
    "38e5e5559730caf93710ca7937ceb17511e70d5356979a700223828f5b58e9e9",
    "c39ed9a49132e90199629a542f75e932dfc2a808684e19719af55eaa5b7da7fc",
    "6b28b005159e4c86a041c4d927db665863bf9d1b24b1660d802f50dbdd84ab07",
    "53eb316498b48aa6edc5b6a5ae8299430d2696a588c576febef380d965bc6e8c",
    "77a3fe503f5c11aaf32d40ac768143769cd0f21ff89214ffda1bdbc69a5d4ace",
    "d32df6cd44214942706b01b785b310d0102e1acb64b9786f1c5d666f3c4d796b",
    "27803233e079f2509c07cbb25962a808c7a6c65f8a99bd99fe54da707b9a45a4",
    "765ff12c95a406baf48020d6ae348e2021a94ce6b40c1426ea4c44a74cab228c",
    "d0522d45ad5883d1dfe4c36925a94fcbc30e828083a87c53ccaa12cd679fed56",
    "a52cb2ecc93349c4a6bd2f7978c4c9038ebc508211a2eb6a066e33b2bc9a529a",
    "ec62a0632977f6fd261698a38df08b62cc56996838b0b19de2a398e7a0429066",
    "088bc060f99c193b0168c7247e1a0622585bcbf802672e011c3bfb4d88b2cf81",
    "ad484a007384e0b23f629cd335620edbae313dc07a31ca58fe1d97fac2ca0b55",
    "1d55d05fcb68c7f58255d16397bd929f32b4f313075414742d363af357ad69c8",
    "b4c9dacf8e194e353dce7638d76f282fe40399f7b0ad74a2229a6d4f5be774de",
    "6fb8963ceb8052837b3fab4f986921791b82afe3dffe09a5e0fe54f86281a2b4",
    "7a209efa3abf7e0e278d4f3eb9a7af187beefa55d5657b7d44cfaf5c02739464",
    "a9aff778374b53b51b616d3bf2856f4adb6fdad2a3f55202355f70302ec39383",
    "cdbce02682b6897a922e902c366d3aa91ba4a61eb5fb31f0af81c1c9a5147175",
    "38334b001abba65528ab2a81bdd124a4ebb3aa9245d8665eed4747fe9887e6d2",
    "3ce72d24130615d5d772d8015eeb810a0b01bcbcc134f7947c36f42e6f635be0",
    "15cf750b7bedb11ba84aeaea4316b8491b5b3f3c2ea66260dce2b234c46d97e3",
    "9c9c16d380ee2ea38bf56c28847c1a88e3dce7eee91f326693936b4549bc58ec",
    "a4eaba691de0db77612509511112db76db988de972717075365a35718d990421",
    "bca1e063a76c7d73265032929b4eadab4be617ed5433c0571649c63bd2734558",
    "22a8f761fe210165da438ad5711a471fda8e5f3c0c91b5f1a2f1467244611d8a",
    "1ed5177e70183ce8333cf11ad039ba6c5e3e520ff7fa89a91c90dbf2b3db7331",
    "b72e64036cfff91f2ac171401ca8003e2f94b55d4184fe737303ab51590af450",
    "d08206d65b51d895e2a6ea9bad707e72a9f87461dd46837ee4f930d7c4df0c61",
    "829d361560d54e2dd41b1f719895b9e8e98f34137a8cfeb162430fe2c666c891",
    "bf273a4700e01b28e69407ef41048098f29a6d98cb8e243a106e3c82d41982a2",
    "0b125ccdf258da646b93c9f2d680d9cc4bd2e18841109760327d814882b0140b",
    "951373e6f752e59746f00193340574df6d3529b07665f6da156552d5182e5489",
    "191adb5f532266e046db16b27f63caf7e438d3fee916b742ce1d4dc0b64a1dd8",
    "de189968460a1e88cad6fcadc03af1a821b9e8c938062b49bb8d2b5f751dd5c6",
    "af5026c11eaa14638813adc4f6889f586a472a02bb5395b03dd432d2b7a38fbd",
    "dda4dbed53bff8d2d814694ea8e4ce88fa6629e1e450d923ce4f1fa7d0491b5e",
    "989923a8f20c4fa00dd52678f2b96d620f28ec8867307320d9b9eeaffef29d06",
    "6bcb6e434274dc03f34248903dc45ce38909c3c32124db0a8d393d5c53788632",
    "7a4234694dab0d28edc60c9312c0ed418c240358e271bd24236335694e3c10b1",
    "fad91317824119818d4bea60cdd1553368cad703193510f6ea049ffd121b36a8",
    "46e73c7855b43cc2d753ed92b2c857899416708d9dee835fe1b3eaa43914904e",
    "0bd8c308e2b0e69e8c45a0d857642a490f365bdb1d444c5439ea91bd68543a9a",
    "250198a7ea057d3617a61d8392ce8ecfd3913a3dda3c9de66292a19729af1f34",
    "9e8efb2de6594b4e0c9ef31cbe56a2828d616e7bbaadc9f8b66822f19c60d9e9",
    "d337256346a5878d3a13cd8810196dc529187031514adaf021f202d4de68fc40",
    "0071bb79d0a2e58b2d539f99f49b08af1ad9c85e735227f04875a356c6b18edb",
    "3f60030a750bf8af6d915e9d8c7b7c05c8a255c90203cb7b8970124b541418e8",
    "e4e1e8eef0d58e9955e345919a9d8eb44ee5f2b3986f6de4c661896b8e128836",
    "fa8b2317bc5d7b9ab822f3c79918481eea406fc544698b652822170087d46cb9",
    "7f71344c776124c9f687317237a8c015a274adbc9805d3c03942e8f9052021a4",
    "68ca8f8d2f1878a8f17f625bc6cf41c208b5ac4eb643734f73b629e56d7777c0",
    "e24487eb7b3cb394cd868bdc8f41bb9c16414c429ca1f68b3adfe1157063cfcd",
    "00e406a0bfe6d6f430081dadde423977bac40ae1c68ebb3f4f2fbe9c8698f49d",
    "acb83f57c29f2cbb92bbba9a4d0f018ee7be99ff3b8c0e2d04a8f73e379d96e5",
    "e44c0295bb220b51516b075e1cd1547d551d464bafdf8cbf8483c4c28388ab1c",
    "516f8d48419db9b8747769bc4a04a82e7a368b88fc4456f905c9cf8881f58118",
    "f5135282480ec94137a88ec21fcfa8047b273a2a0cda6c41f7adc18b57258a52",
    "1428a84b473117c079c78632d3bd557efa2c9f0a4795d3cd6bfbe2eb93e58106",
    "9b3079358080d1de88b5bad267018b5ead9a2f388798aa719cb303bde156af74",
    "d16373e1873dfc8486796bb101253677a58a22a8ea55744c4c1424d716beba92",
    "167a576d0fbe83512dc30f9e9cb5fc0474f9b860721c3e9e7d9ecf39ef298ccd",
    "e6686c32ed91767b200970fbcfb022bc036a6962663fa667896aaedcefc164b2",
    "6c6ad986cebf730ec593477de186609e9aa68ab84e15c15df3ca88669f7c9ec6",
    "6bd2bf838ef7e14d552727a397e138d801daabac2e8b434788826ea8c201cafc",
    "827c828a23692a1b477e5fa13e4ad8cbbd5488bf15a60772e629ffa56b49fe3d",
    "6b224e497203715208f44b280f4f0839ab4155ffbba59c6762adf7eb34a961d3",
    "ded73980da15312194a6da966a17babdfd33a9c5fe7583aea91152c604e2652b",
    "5ba6d07cc9e01caa61389c0529d9fc6a21ea6caf66b8701f739faac2535d922a",
    "6d63be408e4f8b96b65eb47ccd73983a01fbb163fec1e56b9745a5dc0ca67ad7",
    "7b8228a258542d1a63c29a2f85111d35ef30d46704882b2fd63558f3ba380987",
    "2b0a46ee56f357e4f68dd7633d768b0beb9483b3eabb934abb085b84331dfbd7",
    "192b7df8cd768f4c0d25d8d15c81f07cff0582f54fcc5310352aea617e97f3dc",
    "5c206313553aa4e61fe5f282d2a52bd437b5a4901f76f8493d331ecd67621c6d",
    "038531c316198eb2463137682985ccb4093defc7af935d9778ee93cc77232e20",
    "d1d0ffe2757e92387ff26802c2567d3b517edd8ab0ed735f1bda40e19189e4a8",
    "9a0bf0a2f777aa15abfc65719d68e1a4b4c8b04d8c20986ab454f217ed5d1a77",
    "f5ff0267d136ad5fb7803f9a52124305336f884578b8313d52aab6e68cc6ed71",
    "ae33496858396ec389fbb59abffd16ee67bd59b55aa2bc58a026fce3f70d2ddc",
    "bb0fa256f82f0145f105b62f434ba8e7d17f07f51b5a7a9543783190bd3831ec",
    "939ee8e5bd14bff6c01075bf49e45d94f96808f01c99ddeafc8d4b8f44e6a05e",
    "9a54efdd129fd4693c820f2716821442b1eca853e7c93741ef9f0161ea06d4b8",
    "b27b48188002f9d0552742c5bf3604fbf0c6009cd4c98cf9ca10f383154a8e13",
    "7d3926374049c1197716172c631f41d367ce8c17ec98262fe1000b9d51ccf309",
    "faaa988db02ead8936809594f187d4900e83c1e8b227b768091f040369ceb22c",
    "c7efe477b58a476456ce268710468c190ce895c72990d8c5f3d70f48bd9777af",
    "9db840f7f4435a6e2601def426a1cafab40c383934d46efa8f637606ef17a167",
    "7071b73f59d8ee9e262774d07ffe8e9bd13b4bb03812a868bbe8020dc6af9b4e",
    "c91a2355b1d9c27f2750eaf0e4a470547a9c0884b536b9b5c27d791826a74197",
    "55be44002962674316f8eadd80c25d9bb88129002bcdeecf8879f32c9a7222ec",
    "b2947a07585b2362983b505170d37c2932e497d1b0086be58768e7cb11568fc9",
    "01f2c4d66c4c10b75d2955794db414ac9ac47a3da4ce8d73df6e709a57a9da8d",
    "93aafcb9e799308d55f04de188a2524277996a651cbf4687f5be20cb5718ac73",
    "77b82bed4f49392ca8ed1f9e89e2224804ab1876d5ae3a0a38476fdc88a1e1bf",
    "18b110e4533cd8e24dceeb0d6f25c6fe6f21861ad6738cbd07ea21b3fe6d299f",
    "c1acc7d94d6c77a97ec33829ab04aad2cfe2a66f87e515c39c86281e1958bae0",
    "eaa14eb68ba2d887583bedd1f962ccbbbffb69ffa8ed3fd394290cc46af90fb4",
    "c1a6c34f8efa4117812b95df5e852c17d953f41897e6fc56b7930b3270a02d0d",
    "94b82c26a215958ed5cd1969ed815570d2d786c5824fd76b7c145aaacb0b6bf7",
    "ba27f8b62cd14886c7b40bc9723bbc1731f1ab72b1083792cbeea38437fc1fa3",
    "369e9df2ac6ca05847434d3d7b75ea754aa406d96b534a2b3ddf99ee314bd756",
    "f02ea520110c2ecf0b9d24e1a932df150c7ae6d0406c9702437331df11537d83",
    "7adf30a5042aa23d0f2b86b943ffdf8e1a387f9db78354a99ccc70c759c3b3ef",
    "422233b3d3990f51861cb4a0be62fc1158f7d66d1af1e6be190538da1a47675e",
    "2865fdece0d6736d4cc927baf48bbcb71a3cedbcca33c907c95dedbe084e65f2",
    "a219a6d9e8400cb724968b120cd6b0137147270219984475823e8931c315adc6",
    "aab04620c6057ef8f3d152ee0c6fcdc5cf7bdf73111dc9119a08bd84a610035c",
    "7ef52f38e6c3734e221b2476cdafcf8bdd91f772e2b5b1746c09f2ebb925fead",
    "b455965645953a7cc469c9ef671c407b4692cee7974de006ef8376b781ef4c1a",
    "d643d01d87883db2f37c1be44cbb68f3f561e3c5b395e5c502d6ca2e98119f0c",
    "5244bcda8f680e760a4ff06f38c5354cab07c518fe51489741474c766f8a0e82",
    "9ac06bd5cb3382066d394c337a34ac63004b95ed6d18490a5d5923eaf783370f",
    "d48e5a4623aeef5c5a5a0b9c546167c264430f1f37412657b49e56f7810524e5",
    "34cdc61dc537af35237b6cdb423ed5b9ded8be86e786241945f02d11e3e95574",
    "ffead8db2882424c8ba7a9b7bf75257c1c845e695e19c19aef85ae5b08f86bd6",
    "e34f7a98bf9a8c3961da2ace862cdef14917d661886d75cdc7bb9c467a3cf67c",
    "7e8b64ff11d81d9e0d4fd388e5498d7cd7a2a84a967ce2b50c22b1671a15ce91",
    "43b864520467e57468cad954cd568c45d823ac14b004574b373959485f86fe21",
    "8210a952ae17e4fc00231912c7aff6c9b2a96ebd3131164dd0b490f1a74c5b00",
    "20991a32e12d4c2fa136135cf47f2e2f58d1d7dd67946a5d4692eb69a4063d11",
    "9b053c0fc4bcb75fce6a68ba5754e0f4a479f2d6ed3d3cfe3c8f8f11991209a2",
    "2363288c85ce865622d14bc1d7b29bf5c51222ece0aca35d086747178af7ed04",
    "63d1e5f8ca26eea7bf22844f516c8d8666446f612605c2b969448fdb2ea39f10",
    "4af5de7f837dc337115b548461c18bb8ecf37a512f0e01d93065d951acc2129e",
    "bb7784dae8eeb4fdb985ceead81bbff6337b046d89000af71a28429c46ac3746",
    "edb7aeab2c401763dc273f390d59eb6d7a1e954e17cdad1f24f851d89e0b20dc",
    "0348cba26f2bf55643957111f4746ae8a2d019c4992d1b6c5f9067e5f5262a2d",
    "8aa217f6934166643f130cf934a506811651782040a457857313773f0441a896",
    "247ea2dba8b59353286e8d5c0d0af41ad5299ec8423430892894783b0b21934c",
    "820aa3db6e2cd5c94b3ee6927472a2b4e2dea2485d497d2166b8899658900812",
    "2c7ee7353ee7663a908a6cc9542e260ef192b524f9a981d838c32aa521757289",
    "a1dd4f1d614a4531701bc99bbc4ae3e49377f05ee1ce6a06cb561a872ec51d95",
    "f61bd66396f4f5be168e389dc52d729896dfdc7979bbd3c588f80416fa4efd01",
    "cb5a007507df3d7c285d15743d91526286c27afd9d89360f3cc501629fec519b",
    "f0ebbe83feb1c91f2149786c827401326ff8fa6987f430d1ef5424b8cb42bbee",
    "69b34adc3751bf09895c67d5cab057365a2571510edf27a0abc82cb2fc72d8f6",
    "dfc37b264ff3ee0baddef4fed331ff3dd3b071b9ab1bb3953de983eceafafd77",
    "811a2613205b53fa3f998b1d9cd39e6212b6094a7b5a0fa38682b0a20387097d",
    "b2d6e7c753480a05a88fef18731354e934a75785009b07b268e844382a9b9cb2",
    "5331bbc48eeaf872baea693d187c43dc5a267881b90d2f2659c9af724c3c48c5",
    "e579b9be0b8f58daacc4f66c959ed3ec903884d1914e11e7e0c3bbf2a5627b43",
    "b9d06312bf5aee1fa7c879fc61c62edf16e9b523a9f89e04c02000223fbd0de9",
};

pub const hashes_of_zero: [256][32]u8 = calc: {
    @setEvalBranchQuota(100000);
    var ret: [256][32]u8 = undefined;
    comptime var i = 1;
    while (i < 256) : (i += 1) {
        _ = std.fmt.hexToBytes(ret[i][0..], strs[i - 1]) catch @panic("could not convert hash of zero");
    }

    break :calc ret;
};
