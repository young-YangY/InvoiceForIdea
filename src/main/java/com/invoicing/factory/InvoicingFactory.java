/**
 * 
 */
package com.invoicing.factory;

import com.invoicing.dto.GoodsDto;

/**
 * @author yuyang
 * 2017年10月10日
 */
public class InvoicingFactory {

	public static GoodsDto produceGoodsDto() {
		return new GoodsDto();
	}
}
