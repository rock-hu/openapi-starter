--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: prod_catalog; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE prod_catalog (
    prod_catalog_id character varying(20) NOT NULL,
    catalog_name character varying(100),
    use_quick_add character(1),
    style_sheet character varying(2000),
    header_logo character varying(2000),
    content_path_prefix character varying(255),
    template_path_prefix character varying(255),
    view_allow_perm_reqd character(1),
    purchase_allow_perm_reqd character(1),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.prod_catalog OWNER TO ofbiz;

--
-- Name: prod_catalog pk_prod_catalog; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY prod_catalog
    ADD CONSTRAINT pk_prod_catalog PRIMARY KEY (prod_catalog_id);


--
-- Name: prd_ctlg_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prd_ctlg_txcrts ON prod_catalog USING btree (created_tx_stamp);


--
-- Name: prd_ctlg_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prd_ctlg_txstmp ON prod_catalog USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

