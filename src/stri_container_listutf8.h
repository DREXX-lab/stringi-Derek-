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


#ifndef __stri_container_listutf8_h
#define __stri_container_listutf8_h

#include "stri_container_utf8.h"


/**
 * A class to handle conversion between R lists of character
 * vectors and lists of UTF-8 string vectors
 *
 * @version 0.1-?? (Marek Gagolewski, 2013-06-16)
 * @version 0.5-3 (Marek Gagolewski, 2015-06-27)
 *      warning on recycling rule, #174
 */
class StriContainerListUTF8 : public StriContainerBase {

private:

    StriContainerUTF8 **data;


public:

    StriContainerListUTF8();
    StriContainerListUTF8(SEXP rlist, R_len_t nrecycle, bool shallowrecycle=true);
    StriContainerListUTF8(StriContainerListUTF8& container);
    ~StriContainerListUTF8();
    StriContainerListUTF8& operator=(StriContainerListUTF8& container);
    SEXP toR(R_len_t i) const;
    SEXP toR() const;


    /** check if the vectorized ith element is NA
     * @param i index
     * @return true if is NA
     */
    inline bool isNA(R_len_t i) const {
#ifndef NDEBUG
        if (i < 0 || i >= nrecycle)
            throw StriException("StriContainerListUTF8::isNA(): INDEX OUT OF BOUNDS");
#endif
        return (data[i%n] == NULL);
    }


    /** get the vectorized ith element
     * @param i index
     * @return string, read only
     */
    const StriContainerUTF8& get(R_len_t i) const {
#ifndef NDEBUG
        if (i < 0 || i >= nrecycle)
            throw StriException("StriContainerListUTF8::get(): INDEX OUT OF BOUNDS");
        if (data[i%n] == NULL)
            throw StriException("StriContainerListUTF8::get(): isNA");
#endif
        return (*(data[i%n]));
    }
};

#endif
