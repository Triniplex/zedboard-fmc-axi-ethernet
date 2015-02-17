#include <linux/module.h>
#include <linux/vermagic.h>
#include <linux/compiler.h>

MODULE_INFO(vermagic, VERMAGIC_STRING);

__visible struct module __this_module
__attribute__((section(".gnu.linkonce.this_module"))) = {
	.name = KBUILD_MODNAME,
	.init = init_module,
#ifdef CONFIG_MODULE_UNLOAD
	.exit = cleanup_module,
#endif
	.arch = MODULE_ARCH_INIT,
};

static const struct modversion_info ____versions[]
__used
__attribute__((section("__versions"))) = {
	{ 0xeb8183ef, __VMLINUX_SYMBOL_STR(module_layout) },
	{ 0xf9a482f9, __VMLINUX_SYMBOL_STR(msleep) },
	{ 0x7cf690ee, __VMLINUX_SYMBOL_STR(phy_disconnect) },
	{ 0x8093e484, __VMLINUX_SYMBOL_STR(of_mdiobus_register) },
	{ 0xa3799f77, __VMLINUX_SYMBOL_STR(mem_map) },
	{ 0x2e5810c6, __VMLINUX_SYMBOL_STR(__aeabi_unwind_cpp_pr1) },
	{ 0x75a5c86b, __VMLINUX_SYMBOL_STR(irq_of_parse_and_map) },
	{ 0x61cc8068, __VMLINUX_SYMBOL_STR(page_address) },
	{ 0x6e1dcc11, __VMLINUX_SYMBOL_STR(of_parse_phandle) },
	{ 0xd1b63246, __VMLINUX_SYMBOL_STR(arm_dma_ops) },
	{ 0x79aa04a2, __VMLINUX_SYMBOL_STR(get_random_bytes) },
	{ 0xf7802486, __VMLINUX_SYMBOL_STR(__aeabi_uidivmod) },
	{ 0x2a3aa678, __VMLINUX_SYMBOL_STR(_test_and_clear_bit) },
	{ 0x3401079e, __VMLINUX_SYMBOL_STR(phy_ethtool_gset) },
	{ 0xaf7b5f20, __VMLINUX_SYMBOL_STR(of_property_read_u32_array) },
	{ 0xb593efce, __VMLINUX_SYMBOL_STR(devm_ioremap_resource) },
	{ 0x27192461, __VMLINUX_SYMBOL_STR(mdiobus_unregister) },
	{ 0x87e3bc06, __VMLINUX_SYMBOL_STR(__platform_driver_register) },
	{ 0x7d11c268, __VMLINUX_SYMBOL_STR(jiffies) },
	{ 0x27956496, __VMLINUX_SYMBOL_STR(__netdev_alloc_skb) },
	{ 0x123f6144, __VMLINUX_SYMBOL_STR(netif_rx) },
	{ 0x6d37dc66, __VMLINUX_SYMBOL_STR(phy_print_status) },
	{ 0xe707d823, __VMLINUX_SYMBOL_STR(__aeabi_uidiv) },
	{ 0xfa2a45e, __VMLINUX_SYMBOL_STR(__memzero) },
	{ 0xd680754f, __VMLINUX_SYMBOL_STR(dev_err) },
	{ 0x27e1a049, __VMLINUX_SYMBOL_STR(printk) },
	{ 0x4b3ad16c, __VMLINUX_SYMBOL_STR(ethtool_op_get_link) },
	{ 0xde048c65, __VMLINUX_SYMBOL_STR(mdiobus_free) },
	{ 0x7492d272, __VMLINUX_SYMBOL_STR(free_netdev) },
	{ 0xfaef0ed, __VMLINUX_SYMBOL_STR(__tasklet_schedule) },
	{ 0x47123f5c, __VMLINUX_SYMBOL_STR(register_netdev) },
	{ 0x73e20c1c, __VMLINUX_SYMBOL_STR(strlcpy) },
	{ 0xfebae7c7, __VMLINUX_SYMBOL_STR(__dev_kfree_skb_irq) },
	{ 0xbf50a4b4, __VMLINUX_SYMBOL_STR(platform_get_resource) },
	{ 0x9545af6d, __VMLINUX_SYMBOL_STR(tasklet_init) },
	{ 0xd6b8e852, __VMLINUX_SYMBOL_STR(request_threaded_irq) },
	{ 0x8e865d3c, __VMLINUX_SYMBOL_STR(arm_delay_ops) },
	{ 0x82072614, __VMLINUX_SYMBOL_STR(tasklet_kill) },
	{ 0x6d5507e0, __VMLINUX_SYMBOL_STR(_dev_info) },
	{ 0xaa0e1d88, __VMLINUX_SYMBOL_STR(of_property_read_u8_array) },
	{ 0x5fa020e1, __VMLINUX_SYMBOL_STR(eth_type_trans) },
	{ 0xa83e351f, __VMLINUX_SYMBOL_STR(of_phy_connect) },
	{ 0x6a4e5a7d, __VMLINUX_SYMBOL_STR(of_get_property) },
	{ 0x964b790a, __VMLINUX_SYMBOL_STR(eth_validate_addr) },
	{ 0x2a36317, __VMLINUX_SYMBOL_STR(of_get_parent) },
	{ 0xe275a957, __VMLINUX_SYMBOL_STR(dev_warn) },
	{ 0xd36da735, __VMLINUX_SYMBOL_STR(unregister_netdev) },
	{ 0xefd6cf06, __VMLINUX_SYMBOL_STR(__aeabi_unwind_cpp_pr0) },
	{ 0x64b86475, __VMLINUX_SYMBOL_STR(phy_mii_ioctl) },
	{ 0x67022d74, __VMLINUX_SYMBOL_STR(phy_ethtool_sset) },
	{ 0x676bbc0f, __VMLINUX_SYMBOL_STR(_set_bit) },
	{ 0x83215d4f, __VMLINUX_SYMBOL_STR(of_address_to_resource) },
	{ 0xb81960ca, __VMLINUX_SYMBOL_STR(snprintf) },
	{ 0x770af8a0, __VMLINUX_SYMBOL_STR(__netif_schedule) },
	{ 0xca54fee, __VMLINUX_SYMBOL_STR(_test_and_set_bit) },
	{ 0x5c53bb19, __VMLINUX_SYMBOL_STR(consume_skb) },
	{ 0xefc1cad6, __VMLINUX_SYMBOL_STR(platform_driver_unregister) },
	{ 0xb9e95cad, __VMLINUX_SYMBOL_STR(skb_put) },
	{ 0x61050c4d, __VMLINUX_SYMBOL_STR(outer_cache) },
	{ 0xf20dabd8, __VMLINUX_SYMBOL_STR(free_irq) },
	{ 0x1f905fa5, __VMLINUX_SYMBOL_STR(alloc_etherdev_mqs) },
	{ 0x6940d10c, __VMLINUX_SYMBOL_STR(mdiobus_alloc_size) },
};

static const char __module_depends[]
__used
__attribute__((section(".modinfo"))) =
"depends=";

MODULE_ALIAS("of:N*T*Cfmc,axi-ethernet-1.00.a*");
