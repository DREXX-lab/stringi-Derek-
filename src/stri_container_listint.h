/* This file is part of the 'stringi' project.
 * Copyright (c) 2013-2025, Marek Gagolewski <https://www.gagolewski.com/>
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation
 * and/or other materials provided with the distribution.
 *
 * 3. Neither the name of the copyright holder nor the names of its
 * contributors may be used to endorse or promote products derived from
 * this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING,
 * BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
 * OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */


#ifndef __stri_container_listint_h
#define __stri_container_listint_h

#include "stri_container_base.h"
#include "stri_intvec.h"


/**
 * Contains R lists of integer vectors or single integer vectors.
 * Useful for encoding conversion or detection.
 * Each string is represented by the IntVec class,
 * with shallow copy of byte data.

 * @version 0.2-1  (Marek Gagolewski, 2014-03-25)
 */
class StriContainerListInt : public StriContainerBase {

private:

    IntVec* data;


public:

    StriContainerListInt();
    StriContainerListInt(SEXP rlist);
    StriContainerListInt(StriContainerListInt& container);
    ~StriContainerListInt();
    StriContainerListInt& operator=(StriContainerListInt& container);


    /** check if the vectorized ith element is NULL/NA
     * @param i index
     * @return true if is NA
     */
    inline bool isNA(R_len_t i) const {
#ifndef NDEBUG
        if (i < 0 || i >= nrecycle)
            throw StriException("StriContainerListInt::isNA(): INDEX OUT OF BOUNDS");
#endif
        return (data[i%n].isNA());
    }


    /** get the vectorized ith element
     * @param i index
     * @return string, read only
     */
    const IntVec& get(R_len_t i) const {
#ifndef NDEBUG
        if (i < 0 || i >= nrecycle)
            throw StriException("StriContainerListInt::get(): INDEX OUT OF BOUNDS");
        if (data[i%n].isNA())
            throw StriException("StriContainerListInt::get(): isNA");
#endif
        return data[i%n];
    }
};

#endif
