package com.rk.common.exception.file;

import com.rk.common.exception.base.BaseException;

/**
 * 文件信息异常类
 *
 * @author rk
 */
public class FileException extends BaseException
{
    private static final long serialVersionUID = 1L;

    public FileException(String code, Object[] args)
    {
        super("file", code, args, null);
    }

}
