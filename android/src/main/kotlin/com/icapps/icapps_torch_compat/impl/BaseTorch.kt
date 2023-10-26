package com.icapps.icapps_torch_compat.impl

abstract class BaseTorch {

    abstract fun turnOn()
    abstract fun turnOff()
    abstract fun hasTorch() : Boolean
    abstract fun dispose()

}